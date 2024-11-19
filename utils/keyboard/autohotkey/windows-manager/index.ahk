#Include presets.ahk
#Include move.ahk
#Include jump.ahk
#Include utils.ahk


; enabled only when active
#HotIf active

; windows operations
F13 & Backspace::HoldToWinKill("Backspace", "T1.2")("A")
F13 & RShift::WinMinimize "A"
F14 & Backspace::HoldToWinKill("Backspace", "T1.2")("A")
F14 & Space::WinMinimize "A"
F14 & RShift::WinMinimize "A"
F14 & Enter::ToggleMaximize
XButton1 & Esc::HoldToWinKill("Esc", "T1.2")("A")
XButton1 & Space::WinMinimize "A"

; task switch
; - caution: AltTab cannot be disabled by #HotIf
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
XButton1 & Tab::Send "!{Esc}"
XButton1 & WheelDown::Send "!+{Esc}"
XButton1 & WheelUp::Send "!{Esc}"

; workspace switch
F13 & Del::#^Right
F13 & Home::#^Left
F14 & Del::#^Right
F14 & Home::#^Left
XButton1 & RButton::Send "#^{Right}"
XButton1 & LButton::Send "#^{Left}"
XButton1 & MButton::Send "#{Tab}"

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
XButton2 & WheelDown::JumpUp
XButton2 & WheelUp::JumpDown
XButton1 & 1::JumpLeft
XButton1 & 2::JumpRight           
XButton1 & CapsLock::JumpUp
XButton1 & LShift::JumpDown
XButton2 & 1::JumpLeft
XButton2 & 2::JumpRight           
XButton2 & CapsLock::JumpUp
XButton2 & LShift::JumpDown

; gesture
XButton2 & LButton:: {
    if (KeyWait("LButton", "T0.5"))
        JumpLeft
    else
        ToggleMaximize
}
XButton2 & RButton:: {
    if (KeyWait("RButton", "T0.5"))
        JumpRight
    else
        WinMinimize "A"
}
XButton2 & MButton:: {
    if (KeyWait("MButton", "T1.2"))
        JumpFocus("A")
    else
        WinKill "A"
}

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
                Hotkey Format("XButton2 & {}", key), Moving(i, j)
            }
        } catch {
            return
        }
    }
}
HotIf
