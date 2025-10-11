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
    {
        ; single low freq long beep is not active
        SoundBeep 400, 450
    }
    ; update icon
    UpdateActiveStateIcon()
}

; Dynamic remaps
; - manually activated
#HotIf active
Esc::`
LAlt::LCtrl
LWin::LAlt
; this need to disable in inactive mode, game will not recognize Esc otherwise
~CapsLock up::SetCapsLockState "Off"
#HotIf
; - auto deactivated
;   bug: conflicting with Task Manager top search bar
;        can't remap LCtrl::<any key> at all
GroupAdd "SystemSpecial", "ahk_class TaskManagerWindow"
#HotIf active and !WinActive("ahk_group SystemSpecial")
LCtrl::LWin 
#HotIf

; Static remaps
; - put safe remaps here
CapsLock::Esc
Home::Del
Del::Home

