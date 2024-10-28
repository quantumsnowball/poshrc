#Requires AutoHotkey v2.0


;
; KEY REMAPS
;

; Toggle active remap state
active := true
F13 & F14::
F14 & F13::
{
    ; toggle
    global active
    active := !active
    ; play sound
    if active
    {
        ; three high freq short beeps is active
        SoundBeep 800, 150
        SoundBeep 800, 150
        SoundBeep 800, 150
    }
    else
        ; single low freq long beep is not active
        SoundBeep 400, 450

}

; Dynamic remaps
; - put potential conflicting remaps here
#HotIf active
Esc::`
LAlt::LCtrl
LCtrl::LWin
LWin::LAlt
#HotIf

; Static remaps
; - put safe remaps here
CapsLock::Esc
Home::Del
Del::Home


;
; SHORTCUTS
; - modifiers used here should be non conflicting keys
; - better map these keys outside ahk using win registry

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
