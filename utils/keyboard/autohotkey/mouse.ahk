;
; Extra Del button as mouse control prefix button
;

; swap wheel direction, anti-flicking
scrollEvents := []
windowSize := 5
lastScrollTime := 0
resetDelay := 100  ; ms

ScrollHandler(direction) {
    global scrollEvents, lastScrollTime
    scrollEvents.Push(direction)  ; 1 for up, -1 for down
    if (scrollEvents.Length > windowSize) {
        scrollEvents.RemoveAt(1)
    }

    upCount := 0
    for event in scrollEvents {
        if (event = 1) {
            upCount++
        }
    }

    majorityDirection := (upCount > scrollEvents.Length // 2) ? 1 : -1

    if (majorityDirection = 1) {
        Send "{WheelUp}"
    } else {
        Send "{WheelDown}"
    }

    lastScrollTime := A_TickCount
    SetTimer ResetWindow, -resetDelay
}

ResetWindow() {
    global scrollEvents, lastScrollTime, resetDelay
    if (A_TickCount - lastScrollTime >= resetDelay) {
        scrollEvents := []
    }
}

WheelDown::ScrollHandler(1)
WheelUp::ScrollHandler(-1)


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
