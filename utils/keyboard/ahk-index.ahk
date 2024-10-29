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
#Include ahk-shortcuts-L2.ahk

; windows manager
#+h::#Left
#+j::#Down
#+j::#Up
#+l::#Right

return
