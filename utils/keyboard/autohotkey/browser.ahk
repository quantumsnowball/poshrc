; chrome browser
#HotIf active and WinActive("ahk_exe chrome.exe")

; next tab
F13 & WheelUp::
~MButton & WheelUp::Send "^{Tab}"
; previous tab
F13 & WheelDown::
~MButton & WheelDown::Send "^+{Tab}"
; 
F13 & LButton::
~MButton & LButton:: {
    if (KeyWait("LButton", "T0.5"))
        ; left click to go back
        Send "{Browser_Back}"
    else
        ; left hold to close tab
        Send "^w"
}
;
F13 & RButton::
~MButton & RButton:: {
    if (KeyWait("RButton", "T0.5"))
        ; right click to go forward
        Send "{Browser_Forward}"
    else
        ; right hold to restore closed tab
        Send "^+t"
}

; hard refresh
XButton1:: {
    ; fast double click to trigger refresh
    if (KeyWait("XButton1", "D T0.3"))
        Send "^{F5}"
}
; show history tab
XButton2:: {
    ; fast double click to show browser history
    if (KeyWait("XButton2", "D T0.3"))
        Send "^h"
}

#HotIf

