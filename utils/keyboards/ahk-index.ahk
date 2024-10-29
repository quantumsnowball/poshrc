; version 2.0
#Requires AutoHotkey v2.0

; auto reload same script
#SingleInstance Force

; global state variable
active := true

; KEY REMAPS
#Include ahk-remaps.ahk

; SHORTCUTS
#Include ahk-shortcuts-L1.ahk

; media keys
F14 & Up::Volume_Up
F14 & Down::Volume_Down
F14 & PgUp::Volume_Up
F14 & PgDn::Volume_Down
F14 & RShift::Media_Play_Pause
F14 & Right::Media_Next
F14 & Left::Media_Prev

; windows manager
#+h::#Left
#+j::#Down
#+j::#Up
#+l::#Right

return
