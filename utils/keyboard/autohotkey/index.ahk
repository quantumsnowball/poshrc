; version 2.0
#Requires AutoHotkey v2.0

; auto reload same script
#SingleInstance Force

; allow more keypress per interval, default was 2000, 70
A_HotkeyInterval := 2000
A_MaxHotkeysPerInterval := 200

; global state variable
active := true
win_states := Map()
win_focus_states := Map()
msg := ""

; logging
#Include logging.ahk

; KEY REMAPS
#Include remaps.ahk

; SHORTCUTS
#Include text-editing.ahk
#Include media-control.ahk
#Include browser.ahk
#Include windows-manager/index.ahk
#Include utils.ahk
#Include mouse.ahk

; return
return
