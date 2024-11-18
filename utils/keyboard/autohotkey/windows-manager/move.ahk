; helpers
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

