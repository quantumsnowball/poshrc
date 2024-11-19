ToggleMaximize() {
    state := WinGetMinMax("A")
    if (state = 1) 
        WinRestore "A"
    if (state = 0) 
        WinMaximize "A"
}

HoldToWinKill(key, opts) {
    Action(_name) {
        if (!KeyWait(key, opts))
            WinKill _name
    }
    return Action
}
