;
; Extra Del button as mouse control prefix button
;

; swap wheel direction
WheelUp::WheelDown
WheelDown::WheelUp

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
Del & e::MButton
Del & q::RButton

; mouse wheel
Del & t::MouseClick "WheelUp"
Del & g::MouseClick "WheelDown"

#HotIf
