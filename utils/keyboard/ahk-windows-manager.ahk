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
    ; widht and x
    w := A_ScreenWidth * w_pct/100
    x_max := A_ScreenWidth - w
    x := x_max * x_pct/100
    ; height and y
    h := A_ScreenHeight * h_pct/100
    y_max := A_ScreenHeight - h
    y := y_max * y_pct/100
    ; move active window
    WinMove x, y, w, h, "A"
}
F14 & 1::Move(0, 0, .5, .5)
F14 & a::Move(0, 0, .5, .85)
