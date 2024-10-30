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

; consts
W_S := 40
W_M := 55
W_L := 70
H_STD := 85

; left wing
F14 & q::Move(  0,   0, W_S, H_STD)
F14 & a::Move(  0,  50, W_S,   100)
F14 & z::Move(  0, 100, W_S, H_STD)
; central wing
F14 & w::Move( 50,   0, W_S, H_STD)
F14 & s::Move( 50,  50, W_S,   100)
F14 & x::Move( 50, 100, W_S, H_STD)
; central wide
F14 & e::Move( 50,   0, W_M, H_STD)
F14 & d::Move( 50,  50, W_M,   100)
F14 & c::Move( 50, 100, W_M, H_STD)
; central max
F14 & r::Move(100,   0, W_L, H_STD)
F14 & f::Move(100,  50, W_L,   100)
F14 & v::Move(100, 100, W_L, H_STD)
; right wing
F14 & t::Move(100,   0, W_S, H_STD)
F14 & g::Move(100,  50, W_S,   100)
F14 & b::Move(100, 100, W_S, H_STD)
