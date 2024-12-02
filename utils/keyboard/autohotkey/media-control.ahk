;
; SHORTCUTS Layer 2
; - modifiers used here should be non conflicting keys
; - better map these keys outside ahk using win registry

; media keys
F14 & '::Volume_Up
F14 & /::Volume_Down
F14 & .::Media_Play_Pause
F14 & `;::Media_Play_Pause
F14 & Space::Media_Play_Pause
F14 & ]::Media_Next
F14 & [::Media_Prev
XButton1 & WheelDown::Send "{Volume_Up}"
XButton1 & WheelUp::Send "{Volume_Down}"
