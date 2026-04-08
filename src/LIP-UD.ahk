; Initialization and Setup
#Requires AutoHotKey v2.0
#Include menu.ahk
#Include inputs.ahk

SetUp()    ; Check for admin privileges and relaunch as admin if not already

; Hotkeys
#UseHook true
Hotkey up, LIP_SOCD.Bind(,down), "On"
Hotkey down, LIP_SOCD.Bind(,up), "On"







