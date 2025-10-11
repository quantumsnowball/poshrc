; show the active state icon
UpdateActiveStateIcon() {
    if active
        TraySetIcon "icons\tick.ico"
    else
        TraySetIcon "icons\cross.ico"
}

; reload 
F13 & 5::
{
    SoundBeep 400, 400
    Reload
    SetCapsLockState "Off"
    Send "{Esc up}"
    Send "{CapsLock up}"
    Send "{Tab up}"
    Send "{LWin up}"
    Send "{LAlt up}"
    Send "{LCtrl up}"
    Send "{LShift up}"
    Send "{Space up}"
    Send "{RWin up}"
    Send "{RAlt up}"
    Send "{RCtrl up}"
    Send "{RShift up}"
    Send "{Backspace up}"
    Send "{F13 up}"
    Send "{F14 up}"
    SoundBeep 800, 100
}

; lock pc
; - ensure both keys are released before locking, otherwise blocking
F13 & Space:: 
{
    ; disable user input (including Space) to send to any PC app, e.g. YouTube
    BlockInput true
    KeyWait "Space"
    KeyWait "F13"
    BlockInput false
    DllCall("LockWorkStation")
}
