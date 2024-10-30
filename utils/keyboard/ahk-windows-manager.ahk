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
Move(x_pct, y_pct, w_pct, h_pct) {
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
    x := Integer(x), y = Integer(y), w = Integer(w), h = Integer(h)
    WinMove x, y, w, h, "A"
    ; debug
    global msg
    ; msg := Format("{1}, {2}, {3}, {4}", Left, Top, Right, Bottom)
    ; msg := Format("Move(x={1}, y={2}, w={3}, h={4})", x, y, w, h)
}

; consts
W_S := 40
W_M := 55
W_L := 70
H_STD := 85

; presets
moves := [
    [ 
        ; left
        (_) => Move(  0,   0, W_S, H_STD),
        (_) => Move(  0,  50, W_S,   100),
        (_) => Move(  0, 100, W_S, H_STD),
    ], [
        ; left wide
        (_) => Move(  0,   0, W_M, H_STD),
        (_) => Move(  0,  50, W_M,   100),
        (_) => Move(  0, 100, W_M, H_STD),
    ], [
        ; central
        (_) => Move( 50,   0, W_S, H_STD),
        (_) => Move( 50,  50, W_S,   100),
        (_) => Move( 50, 100, W_S, H_STD),
    ], [
        ; central wide
        (_) => Move( 50,   0, W_M, H_STD),
        (_) => Move( 50,  50, W_M,   100),
        (_) => Move( 50, 100, W_M, H_STD),
    ], [
        ; central max
        (_) => Move(100,   0, W_L, H_STD),
        (_) => Move(100,  50, W_L,   100),
        (_) => Move(100, 100, W_L, H_STD),
    ], [
        ; right wide
        (_) => Move(100,   0, W_M, H_STD),
        (_) => Move(100,  50, W_M,   100),
        (_) => Move(100, 100, W_M, H_STD),
    ], [
        ; right
        (_) => Move(100,   0, W_S, H_STD),
        (_) => Move(100,  50, W_S,   100),
        (_) => Move(100, 100, W_S, H_STD),
    ],
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
        Hotkey Format("F14 & {}", key), moves[i][j]
    }
}

