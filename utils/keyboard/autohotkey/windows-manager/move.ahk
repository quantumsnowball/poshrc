; helpers
CalcPresetCoor(x_pct, y_pct, w_pct, h_pct) {
    ; get working area, account for taskbar
    MonitorGetWorkArea(1, &left, &top, &right, &bottom)
    ; widht and x
    w_area := right - left
    w := w_area * w_pct/100
    x_max := w_area - w
    x := left + x_max * x_pct/100
    ; height and y
    h_area := bottom - top
    h := h_area * h_pct/100
    y_max := h_area - h
    y := top + y_max * y_pct/100
    ; return
    return [x, y, w, h, x+w, y+h]
}

Moving(i, j) {
    ; specific [title, class] to blacklist
    BLACKLIST := [
        ; desktop
        ["", "WorkerW"],
        ; system tray
        ["", "Shell_TrayWnd"],
        ["System tray overflow window.", "TopLevelWindowForOverflowXamlIsland"],
        ["Notification Center", "Windows.UI.Core.CoreWindow"],
        ["Quick settings", "Windows.UI.Core.CoreWindow"],
        ; start menu
        ["Search", "Windows.UI.Core.CoreWindow"],
        ["Task View", "XamlExplorerHostIslandWindow"],
        ["", "WindowsDashboard"],
        ["", "XamlExplorerHostIslandWindow_WASDK"],
    ]

    Move(_name) {
        ; blacklist
        title := WinGetTitle("A")
        class := WinGetClass("A")
        for _, b in BLACKLIST {
            if (title = b[1] && class = b[2]) {
                Log(Format('Move (blocked): ["{1}", "{2}"]', title, class))
                return
            }
        }
        ; debug
        global msg
        ; get presets
        x_pct := PRESETS[i][j][1]
        y_pct := PRESETS[i][j][2]
        w_pct := PRESETS[i][j][3]
        h_pct := PRESETS[i][j][4]
        ; get working area, account for taskbar
        MonitorGetWorkArea(1, &left, &top, &right, &bottom)
        ; widht and x
        w_area := right - left
        w := w_area * w_pct/100
        x_max := w_area - w
        x := left + x_max * x_pct/100
        ; height and y
        h_area := bottom - top
        h := h_area * h_pct/100
        y_max := h_area - h
        y := top + y_max * y_pct/100
        ; move active window
        WinMove x, y, w, h, "A"
        ; remember window state
        global win_states
        pid := WinGetID("A")
        win_states[pid] := {i: i, j: j} 
        ; debug
        Log(Format('Move          : ["{1}", "{2}"]', title, class))
    }

    return Move
}


FindBestFitPreset() {
    ; get A window pos
    WinGetPos &wX, &wY, &wW, &wH, "A"
    wX_ := wX + wW
    wY_ := wY + wH
    ; start from largest dist
    rolling_min_dist := 999999
    ; default preset
    best_preset := { i: 7, j: 3 }
    ; loop through presets to find min sum of abs corner distances
    for i, col in PRESETS {
        for j, row in col {
            ; calc the distance between corresponding four corners
            coor := CalcPresetCoor(row[1], row[2], row[3], row[4])
            pX := coor[1]
            pY := coor[2]
            pW := coor[3]
            pH := coor[4]
            pX_ := coor[5]
            pY_ := coor[6]
            dist11 := Sqrt((wX  - pX )**2 + (wY  - pY )**2)
            dist21 := Sqrt((wX_ - pX_)**2 + (wY  - pY )**2)
            dist12 := Sqrt((wX  - pX )**2 + (wY_ - pY_)**2)
            dist22 := Sqrt((wX_ - pX_)**2 + (wY_ - pY_)**2)
            ; Log(dist11 ',' dist21 ',' dist12 ',' dist22)
            dist := (dist11 + dist21 + dist12 + dist22) / 4
            Log('dist:' dist)
            if (dist < rolling_min_dist) {
                best_preset := { i: i, j: j }
                rolling_min_dist := dist
                Log('dist=' rolling_min_dist ', i,j=' i ',' j)
            }
        }
    }
    ; return best preset found
    return best_preset
}
