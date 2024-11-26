; get working area, account for taskbar
MonitorGetWorkArea(1, &MON_LEFT, &MON_TOP, &MON_RIGHT, &MON_BOTTOM)

; helpers
CalcPresetCoordinate(x_pct, y_pct, w_pct, h_pct) {
    ; widht and x
    w_area := MON_RIGHT - MON_LEFT
    w := w_area * w_pct/100
    x_max := w_area - w
    x := MON_LEFT + x_max * x_pct/100
    ; height and y
    h_area := MON_BOTTOM - MON_TOP
    h := h_area * h_pct/100
    y_max := h_area - h
    y := MON_TOP + y_max * y_pct/100
    ; return
    return { X:x, Y:y, W:w, H:h, X_:x+w, Y_:y+h }
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
        p := CalcPresetCoordinate(x_pct, y_pct, w_pct, h_pct)
        ; move active window
        WinMove p.X, p.Y, p.W, p.H, "A"
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
            p := CalcPresetCoordinate(row[1], row[2], row[3], row[4])
            dist11 := Sqrt((wX  - p.X )**2 + (wY  - p.Y )**2)
            dist21 := Sqrt((wX_ - p.X_)**2 + (wY  - p.Y )**2)
            dist12 := Sqrt((wX  - p.X )**2 + (wY_ - p.Y_)**2)
            dist22 := Sqrt((wX_ - p.X_)**2 + (wY_ - p.Y_)**2)
            ; update the rolling dist and best preset found
            dist := (dist11 + dist21 + dist12 + dist22) / 4
            if (dist < rolling_min_dist) {
                best_preset := { i: i, j: j }
                rolling_min_dist := dist
            }
        }
    }
    ; return best preset found
    return best_preset
}
