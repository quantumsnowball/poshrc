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
    KeyWait "Space"
    KeyWait "F13"
    DllCall("LockWorkStation")
}
