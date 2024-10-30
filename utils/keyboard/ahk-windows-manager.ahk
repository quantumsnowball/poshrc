; windows operations
F13 & Home::WinKill "A"
F14 & Home::WinKill "A"
F13 & /::WinMinimize "A"
F14 & /::WinMinimize "A"


; task switch
F13 & ]::AltTab
F13 & \::AltTab
F13 & [::ShiftAltTab
F13 & Tab::ShiftAltTab
F14 & \::AltTab
F14 & Tab::ShiftAltTab

; workspace switch
F14 & ]::#^Right
F14 & [::#^Left
F14 & PgDn::#^Right
F14 & PgUp::#^Left


;
; move and resize
;

; helpers
Move(x_pct, y_pct, w_pct, h_pct, i, j) {
    ; debug
    global msg
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
    ; x := Integer(x), y = Integer(y), w = Integer(w), h = Integer(h)
    WinMove x, y, w, h, "A"
    ; remember window state
    global win_states
    pid := WinGetPID("A")
    win_states[pid] := {i: i, j: j} 
    ; debug
    ; msg := Format("{1},{2}", win_states[pid].i ,win_states[pid].j)
    ; msg := Format("{1}, {2}, {3}, {4}", Left, Top, Right, Bottom)
    ; msg := Format("Move(x={1}, y={2}, w={3}, h={4})", x, y, w, h)
}

; consts
W_S := 33.33
W_M := 50.0
W_L := 66.67
H_STD := 85

; presets
moves := [
    [ ; left
        (i, j) => (_) => Move(  0,   0, W_S, H_STD, i, j),
        (i, j) => (_) => Move(  0,  50, W_S,   100, i, j),
        (i, j) => (_) => Move(  0, 100, W_S, H_STD, i, j), ], 
    [ ; left wide
        (i, j) => (_) => Move(  0,   0, W_M, H_STD, i, j),
        (i, j) => (_) => Move(  0,  50, W_M,   100, i, j),
        (i, j) => (_) => Move(  0, 100, W_M, H_STD, i, j), ], 
    [ ; central
        (i, j) => (_) => Move( 50,   0, W_S, H_STD, i, j),
        (i, j) => (_) => Move( 50,  50, W_S,   100, i, j),
        (i, j) => (_) => Move( 50, 100, W_S, H_STD, i, j), ], 
    [ ; central wide
        (i, j) => (_) => Move( 50,   0, W_M, H_STD, i, j),
        (i, j) => (_) => Move( 50,  50, W_M,   100, i, j),
        (i, j) => (_) => Move( 50, 100, W_M, H_STD, i, j), ], 
    [ ; central max
        (i, j) => (_) => Move(100,   0, W_L, H_STD, i, j),
        (i, j) => (_) => Move(100,  50, W_L,   100, i, j),
        (i, j) => (_) => Move(100, 100, W_L, H_STD, i, j), ], 
    [ ; right wide
        (i, j) => (_) => Move(100,   0, W_M, H_STD, i, j),
        (i, j) => (_) => Move(100,  50, W_M,   100, i, j),
        (i, j) => (_) => Move(100, 100, W_M, H_STD, i, j), ], 
    [ ; right
        (i, j) => (_) => Move(100,   0, W_S, H_STD, i, j),
        (i, j) => (_) => Move(100,  50, W_S,   100, i, j),
        (i, j) => (_) => Move(100, 100, W_S, H_STD, i, j), ],
]

; keys activated
keys := [
    ["q","a","z"],
    ["w","s","x"],
    ["e","d","c"],
    ["r","f","v"],
    ["t","g","b"],
    ["y","h","n"],
    ["u","j","m"],
]

; assignment
for i, col in keys {
    for j, key in col {
        try {
            Hotkey Format("F14 & {}", key), moves[i][j](i, j)
        } catch {
            return
        }
    }
}

