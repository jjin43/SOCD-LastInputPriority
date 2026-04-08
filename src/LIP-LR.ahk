; Initialization and Setup
#Requires AutoHotKey v2.0
#Include menu.ahk
#Include inputs.ahk

SetUp()    ; Check for admin privileges and relaunch as admin if not already

; Hotkeys
#UseHook true
Hotkey left, LIP_SOCD.Bind(,right), "On"
Hotkey right, LIP_SOCD.Bind(,left), "On"






