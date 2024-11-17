#Include presets.ahk
#Include move.ahk
#Include jump.ahk


; windows operations
F13 & Backspace::WinKill "A"
F13 & RShift::WinMinimize "A"
F14 & Backspace::WinKill "A"
F14 & RShift::WinMinimize "A"
F14 & Enter::{
    state := WinGetMinMax("A")
    if (state = 1) 
        WinRestore "A"
    if (state = 0) 
        WinMaximize "A"
}

; task switch
F13 & \::AltTab
F13 & Tab::ShiftAltTab
F13 & PgDn::AltTab
F13 & PgUp::ShiftAltTab
F14 & \::AltTab
F14 & Tab::ShiftAltTab
F14 & PgDn::AltTab
F14 & PgUp::ShiftAltTab

; workspace switch
F13 & Del::#^Right
F13 & Home::#^Left
F14 & Del::#^Right
F14 & Home::#^Left

; move, jump, resize
for i, col in PRESETS {
    for j, row in col {
        keys := row[5]
        try {
            for _, key in StrSplit(keys)
                Hotkey Format("F14 & {}", key), Moving(i, j)
        } catch {
            return
        }
    }
}
F13 & Left::JumpLeft
F13 & Right::JumpRight           
F13 & Up::JumpUp
F13 & Down::JumpDown
F14 & Left::JumpLeft
F14 & Right::JumpRight           
F14 & Up::JumpUp
F14 & Down::JumpDown
F14 & 1::JumpLeft
F14 & 2::JumpRight           
F14 & CapsLock::JumpUp
F14 & LShift::JumpDown
