;
; SHORTCUTS Layer 1
; - modifiers used here should be non conflicting keys
; - better map these keys outside ahk using win registry

; Arrow Keys
F13 & h::Left
F13 & j::Down
F13 & k::Up
F13 & l::Right

; navigate
F13 & n::Home
F13 & .::End
; F13 & u::PgUp
F13 & d::PgDn
F13 & `;::PgUp
F13 & '::PgDn

; jump
F13 & ,::^Left
F13 & m::^Right
F13 & b::^Left
F13 & w::^Right

; select
F13 & i::^+Left
F13 & u::^+Right
F13 & y::+Home
F13 & o::+End
F13 & v::Send "{Home}+{End}"

; edit
F13 & c::^Del
F13 & x::Del
F13 & r::F2
F13 & [::^Backspace
F13 & ]::^Del

; undo
F13 & z::^z

; full screen toggle
F13 & Enter::!Enter

; datetime
F13 & 1::Send FormatTime("", "yyyy-MM-dd")
F13 & 2::Send FormatTime("", "yyyy-MM-dd HH:mm:ss")
F13 & 3::Send FormatTime("", "yyyy-MM-dd_HH.mm.ss")
F13 & 4::Send FormatTime("", "yyyyMMdd_HHmmss")

