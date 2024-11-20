; chrome browser
#HotIf active and WinActive("ahk_exe chrome.exe")

F13 & WheelUp::Send "^{Tab}"
F13 & WheelDown::Send "^+{Tab}"
F13 & RButton:: {
    if (KeyWait("RButton", "T0.8"))
        Send "{Browser_Back}"
    else
        Send "^w"
}
F13 & LButton:: {
    if (KeyWait("LButton", "T0.4"))
        Send "{Browser_Forward}"
    else
        Send "^+t"
}

~MButton & WheelUp::Send "^{Tab}"
~MButton & WheelDown::Send "^+{Tab}"
~MButton & RButton:: {
    if (KeyWait("RButton", "T0.8"))
        Send "{Browser_Back}"
    else
        Send "^w"
}
~MButton & LButton:: {
    if (KeyWait("LButton", "T0.8"))
        Send "{Browser_Forward}"
    else
        Send "^+t"
}

XButton1::Send "^{F5}"
XButton2::Send "^h"

#HotIf

