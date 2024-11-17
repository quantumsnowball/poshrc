;
; KEY REMAPS
;

; Toggle active remap state
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

