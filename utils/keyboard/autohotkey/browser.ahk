; chrome browser
#hotif active and winactive("ahk_exe chrome.exe")

F13 & WheelUp::Send "^{Tab}"
F13 & WheelDown::Send "^+{Tab}"
F13 & XButton1::Send "^w"

~MButton & WheelUp::Send "^{Tab}"
~MButton & WheelDown::Send "^+{Tab}"
~MButton & XButton1::Send "^w"

#HotIf

