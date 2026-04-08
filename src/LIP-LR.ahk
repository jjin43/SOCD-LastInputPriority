; Initialization and Setup
#Requires AutoHotKey v2.0
#Include menu.ahk
#Include inputs.ahk

setUp()    ; Check for admin privileges and relaunch as admin if not already

; Hotkeys
#UseHook true
Hotkey left, inputLeft, "On"
Hotkey right, inputRight, "On"
Hotkey pauseButton, pauseToggle, "On"
Hotkey exitButton, exitFunc, "On"
Hotkey lWin, doNothing, "On"
Hotkey rWin, doNothing, "On"







