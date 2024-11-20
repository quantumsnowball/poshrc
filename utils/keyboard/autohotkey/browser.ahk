; chrome browser
#HotIf active and WinActive("ahk_exe chrome.exe")

F13 & WheelUp::
~MButton & WheelUp::Send "^{Tab}"
F13 & WheelDown::
~MButton & WheelDown::Send "^+{Tab}"
F13 & LButton::
~MButton & LButton:: {
    if (KeyWait("LButton", "T0.8"))
        Send "{Browser_Back}"
    else
        Send "^w"
}
F13 & RButton::
~MButton & RButton:: {
    if (KeyWait("RButton", "T0.8"))
        Send "{Browser_Forward}"
    else
        Send "^+t"
}

XButton1::Send "^{F5}"
XButton2::Send "^h"

#HotIf

