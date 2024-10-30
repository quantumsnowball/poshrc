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

; move and resize
Move(x, y, w_pct, h_pct)
{
    WinMove x, y, A_ScreenWidth*w_pct, A_ScreenHeight*h_pct, "A"
}
F14 & 1::Move(0, 0, .5, .5)
F14 & a::Move(0, 0, .5, .85)
