ToggleMaximize() {
    state := WinGetMinMax("A")
    if (state = 1) 
        WinRestore "A"
    if (state = 0) 
        WinMaximize "A"
}

