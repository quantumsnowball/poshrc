; helpers
Jump(m, n) {
    len := PRESETS[1].Length
    pid := WinGetID("A")
    try {
        ; find the last use preset
        p := win_states[pid]
    } catch {
        ; find the closest preset
        p := FindBestFitPreset()
    }
    i := p.i + m
    j := p.j + n
    if (1<=i && i<=PRESETS.Length) {
        j := j<1 ? len : j>len ? 1 : j
        Moving(i, j)("-")
    }
}

JumpLeft  := () => Jump(-1,  0)
JumpRight := () => Jump(+1,  0)
JumpUp    := () => Jump( 0, -1)
JumpDown  := () => Jump( 0, +1)

JumpFocus(_name) {
    ; remember window focus state
    global win_focus_states
    len := PRESETS_FOCUS.Length
    pid := WinGetID("A")
    try {
        p := win_focus_states[pid]
    } catch {
        p := 1
    }
    p := p>=len ? 1 : p+1
    i := PRESETS_FOCUS[p][1]
    j := PRESETS_FOCUS[p][2]
    Moving(i, j)("-")
    win_focus_states[pid] := p
}
