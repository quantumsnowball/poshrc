#Requires AutoHotkey v2.0


; remaps
CapsLock::Esc
Esc::`
LAlt::LCtrl
LCtrl::LWin
LWin::LAlt
Home::Del
Del::Home


; Arrow Keys
F13 & h::Left
F13 & j::Down
F13 & k::Up
F13 & l::Right

; Home, End, PgUp, PgDown
F13 & n::Home
F13 & .::End
F13 & m::PgDn
F13 & ,::PgUp
F13 & d::PgDn
F13 & u::PgUp

; word jumping, changing, deleting, renaming
F13 & w::^Right
F13 & b::^Left
F13 & c::^Del
F13 & x::Del
F13 & r::F2

; full screen toggle
F13 & Enter::!Enter

; media keys
F14 & Up::Volume_Up
F14 & Down::Volume_Down
F14 & PgUp::Volume_Up
F14 & PgDn::Volume_Down
F14 & RShift::Media_Play_Pause
F14 & Right::Media_Next
F14 & Left::Media_Prev


return
