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
