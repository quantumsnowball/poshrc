; windows manager
#+h::#Left
#+j::#Down
#+k::#Up
#+l::#Right

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

; standard presets
F14 & q::Move(  0,   0,  40,  80)
F14 & a::Move(  0,  50,  40, 100)
F14 & z::Move(  0, 100,  40,  80)

F14 & w::Move( 50,   0,  40,  80)
F14 & s::Move( 50,  50,  40, 100)
F14 & x::Move( 50, 100,  40,  80)

F14 & e::Move(100,   0,  40,  80)
F14 & d::Move(100,  50,  40, 100)
F14 & c::Move(100, 100,  40,  80)
