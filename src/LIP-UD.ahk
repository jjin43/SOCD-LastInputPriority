; Initialization and Setup
#Requires AutoHotKey v2.0
#Include menu.ahk
#Include inputs.ahk

setUp()    ; Check for admin privileges and relaunch as admin if not already

; Hotkeys
#UseHook true
Hotkey up, inputUp, "On"
Hotkey down, inputDown, "On"
Hotkey pauseButton, pauseToggle, "On"
Hotkey exitButton, exitFunc, "On"







