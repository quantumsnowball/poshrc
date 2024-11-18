#Include presets.ahk
#Include move.ahk
#Include jump.ahk
#Include utils.ahk


; enabled only when active
#HotIf active

; windows operations
F13 & Backspace::WinKill "A"
F13 & RShift::WinMinimize "A"
F14 & Backspace::WinKill "A"
F14 & Space::WinMinimize "A"
F14 & RShift::WinMinimize "A"
F14 & Enter::ToggleMaximize
XButton1 & Esc::WinKill "A"
XButton1 & Space::WinMinimize "A"
XButton2 & RButton::WinMinimize "A"
XButton2 & MButton::WinKill "A"

; task switch
F13 & \::AltTab
F13 & Tab::ShiftAltTab
F13 & PgDn::AltTab
F13 & PgUp::ShiftAltTab
F14 & \::AltTab
F14 & Tab::ShiftAltTab
F14 & PgDn::AltTab
F14 & PgUp::ShiftAltTab
F14 & WheelUp::AltTab
F14 & WheelDown::ShiftAltTab
XButton1 & Tab::AltTab
XButton2 & WheelUp::AltTab
XButton2 & WheelDown::ShiftAltTab

; workspace switch
F13 & Del::#^Right
F13 & Home::#^Left
F14 & Del::#^Right
F14 & Home::#^Left
XButton1 & WheelUp::Send "#^{Right}"
XButton1 & WheelDown::Send "#^{Left}"

; jump
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
XButton1 & LButton::JumpLeft
XButton1 & RButton::JumpRight
XButton1 & MButton::JumpDown
XButton1 & 1::JumpLeft
XButton1 & 2::JumpRight           
XButton1 & CapsLock::JumpUp
XButton1 & LShift::JumpDown

#HotIf


; enabled only when active
HotIf 'active'

; move
for i, col in PRESETS {
    for j, row in col {
        keys := row[5]
        try {
            for _, key in StrSplit(keys) {
                Hotkey Format("F14 & {}", key), Moving(i, j)
                Hotkey Format("XButton1 & {}", key), Moving(i, j)
            }
        } catch {
            return
        }
    }
}
Hotkey "XButton2 & LButton", Moving(8, 3)
HotIf
