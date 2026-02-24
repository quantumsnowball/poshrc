;
; KEY REMAPS
;

; Toggle active remap state
ToggleActiveState() {
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
F13 & F14::ToggleActiveState
F14 & F13::ToggleActiveState
; F14:: {
;     if (KeyWait("F14", "D T0.1"))
;         ToggleActiveState
; }

; Dynamic remaps
; - manually activated
#HotIf active
Esc::`
$LAlt::LCtrl
$LWin::LAlt
#HotIf

; - auto deactivated
;   bug: conflicting with Task Manager top search bar
;        can't remap LCtrl::<any key> at all
GroupAdd "SystemSpecial", "ahk_class TaskManagerWindow"
#HotIf active and !WinActive("ahk_group SystemSpecial")
$LCtrl::LWin 
#HotIf

; Static remaps
; - put safe remaps here
*CapsLock::
{
    SetCapsLockState "AlwaysOff"
    Send "{Esc}"
}
Home::Del
Del::Home

