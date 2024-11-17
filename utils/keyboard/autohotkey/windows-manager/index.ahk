; windows operations
F13 & Backspace::WinKill "A"
F13 & RShift::WinMinimize "A"
F14 & Backspace::WinKill "A"
F14 & RShift::WinMinimize "A"
F14 & Enter::{
    state := WinGetMinMax("A")
    if (state = 1) 
        WinRestore "A"
    if (state = 0) 
        WinMaximize "A"
}


; task switch
F13 & \::AltTab
F13 & Tab::ShiftAltTab
F13 & PgDn::AltTab
F13 & PgUp::ShiftAltTab
F14 & \::AltTab
F14 & Tab::ShiftAltTab
F14 & PgDn::AltTab
F14 & PgUp::ShiftAltTab

; workspace switch
F13 & Del::#^Right
F13 & Home::#^Left
F14 & Del::#^Right
F14 & Home::#^Left


;
; move and resize
;

; consts
X_LEFT    := 0
X_CENTER  := 50
X_RIGHT   := 100
Y_TOP     := 0
Y_CENTER  := 50
Y_BOTTOM  := 100
W_TINY    := 25.0
W_SMALL   := 33.33
W_MEDIUM  := 50.0
W_LARGE   := 66.67
W_GIANT   := 75.0
H_MEDIUM  := 50
H_NORMAL  := 85
H_FULL    := 100


; presets
#Include presets.ahk

; helpers
Moving(i, j) {
    Move(_name) {
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
        ; msg := Format("{1},{2}", win_states[pid].i ,win_states[pid].j)
        ; msg := Format("{1}, {2}, {3}, {4}", Left, Top, Right, Bottom)
        ; msg := Format("Move(x={1}, y={2}, w={3}, h={4})", x, y, w, h)
    }

    return Move
}

Jump(m, n) {
    len := PRESETS[1].Length
    pid := WinGetID("A")
    try {
        p := win_states[pid]
        i := p.i + m
        j := p.j + n
        if (1<=i && i<=PRESETS.Length) {
            j := j<1 ? len : j>len ? 1 : j
            Moving(i, j)("-")
        }
    } catch {
        ; default is central full
        Moving(7, 3)("-")
    }
}
JumpLeft  := () => Jump(-1,  0)
JumpRight := () => Jump(+1,  0)
JumpUp    := () => Jump( 0, -1)
JumpDown  := () => Jump( 0, +1)

; assignment
for i, col in PRESETS {
    for j, row in col {
        keys := row[5]
        try {
            for _, key in StrSplit(keys)
                Hotkey Format("F14 & {}", key), Moving(i, j)
        } catch {
            return
        }
    }
}

F13 & Left::JumpLeft
F13 & Right::JumpRight           
F13 & Up::JumpUp
F13 & Down::JumpDown
F14 & Left::JumpLeft
F14 & Right::JumpRight           
F14 & Up::JumpUp
F14 & Down::JumpDown
F14 & 1::JumpLeft
F14 & 2::JumpRight           
F14 & CapsLock::JumpUp
F14 & LShift::JumpDown
