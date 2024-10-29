; mouse movement
F14 & w::MouseMove   0,-20, 0, "R"
F14 & s::MouseMove   0,+20, 0, "R" 
F14 & a::MouseMove -20,  0, 0, "R"
F14 & d::MouseMove +20,  0, 0, "R" 

; mouse click
F14 & f::LButton
F14 & r::RButton
F14 & e::LButton
F14 & q::RButton

; mouse wheel
F14 & t::MouseClick "WheelUp"
F14 & g::MouseClick "WheelDown"


;
; Extra Del button as mouse control prefix button
;
#HotIf active

; disable original key action
Del::Return

; mouse movement
Del & w::MouseMove   0,-20, 0, "R"
Del & s::MouseMove   0,+20, 0, "R" 
Del & a::MouseMove -20,  0, 0, "R"
Del & d::MouseMove +20,  0, 0, "R" 

; mouse click
Del & f::LButton
Del & r::RButton
Del & e::LButton
Del & q::RButton

; mouse wheel
Del & t::MouseClick "WheelUp"
Del & g::MouseClick "WheelDown"

#HotIf
