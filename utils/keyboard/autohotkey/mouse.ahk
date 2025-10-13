;
; Extra Del button as mouse control prefix button
;

; anti-flicking script
scrollEvents := []
windowSize := 5
lastScrollTime := 0
resetDelay := 100  ; ms

ScrollHandler(direction) {
    global scrollEvents, lastScrollTime

    ; every raw scroll event is a vote
    ; cast the vote to a global vote box
    ; 1 for up, -1 for down
    scrollEvents.Push(direction)

    ; if it is full, then fifo
    if (scrollEvents.Length > windowSize) {
        scrollEvents.RemoveAt(1)
    }

    ; count the number of up events
    upCount := 0
    for event in scrollEvents {
        if (event = 1) {
            upCount++
        }
    }

    ; if up events vot is more than have population, declare win, else loss
    majorityDirection := (upCount > scrollEvents.Length // 2) ? 1 : -1

    ; send the real event based on the vote result
    if (majorityDirection = 1) {
        Send "{WheelUp}"
    } else {
        Send "{WheelDown}"
    }

    ; set a new timer to try to clear the vote box after some delay
    lastScrollTime := A_TickCount
    SetTimer ResetWindow, -resetDelay
}

ResetWindow() {
    global scrollEvents, lastScrollTime, resetDelay

    ; will only reset vote box if the time different is larger than resetDelay
    if (A_TickCount - lastScrollTime >= resetDelay) {
        scrollEvents := []
    }
}

; swap wheel direction 
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
