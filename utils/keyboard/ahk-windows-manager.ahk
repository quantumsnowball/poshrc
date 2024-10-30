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
F14 & PgDn::#^Right
F14 & PgUp::#^Left


;
; move and resize
;

; consts
W_S := 33.33
W_M := 50.0
W_L := 66.67
H_STD := 85

; presets
presets := [
    [ ; left
        [  0,   0, W_S, H_STD],
        [  0,  50, W_S,   100],
        [  0, 100, W_S, H_STD], ], 
    [ ; left wide
        [  0,   0, W_M, H_STD],
        [  0,  50, W_M,   100],
        [  0, 100, W_M, H_STD], ], 
    [ ; central
        [ 50,   0, W_S, H_STD],
        [ 50,  50, W_S,   100],
        [ 50, 100, W_S, H_STD], ], 
    [ ; central wide
        [ 50,   0, W_M, H_STD],
        [ 50,  50, W_M,   100],
        [ 50, 100, W_M, H_STD], ], 
    [ ; central max
        [100,   0, W_L, H_STD],
        [100,  50, W_L,   100],
        [100, 100, W_L, H_STD], ], 
    [ ; right wide
        [100,   0, W_M, H_STD],
        [100,  50, W_M,   100],
        [100, 100, W_M, H_STD], ], 
    [ ; right
        [100,   0, W_S, H_STD],
        [100,  50, W_S,   100],
        [100, 100, W_S, H_STD], ],
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

; helpers
Moving(i, j) {
    Move(_name) {
        ; debug
        global msg
        ; get presets
        x_pct := presets[i][j][1]
        y_pct := presets[i][j][2]
        w_pct := presets[i][j][3]
        h_pct := presets[i][j][4]
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

    return Move
}

Jump(m, n) {
    pid := WinGetPID("A")
    try {
        p := win_states[pid]
        i := p.i + m
        j := p.j + n
        if (1<=i && i<=keys.Length && 1<=j && j<=3) {
            Moving(i, j)("-")
        }
    } catch {
        Moving(4, 2)("-")
    }
}
JumpLeft  := () => Jump(-1,  0)
JumpRight := () => Jump(+1,  0)
JumpUp    := () => Jump( 0, -1)
JumpDown  := () => Jump( 0, +1)

; assignment
for i, col in keys {
    for j, key in col {
        try {
            Hotkey Format("F14 & {}", key), Moving(i, j)
        } catch {
            return
        }
    }
}

F14 & [::JumpLeft
F14 & ]::JumpRight           
F14 & `;::JumpUp
F14 & .::JumpDown
