; chrome browser
#HotIf WinActive("ahk_exe chrome.exe")

F13 & WheelUp::Send "^{Tab}"
F13 & WheelDown::Send "^+{Tab}"
F13 & MButton::Send "^w"

#HotIf

