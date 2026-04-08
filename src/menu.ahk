#Requires AutoHotkey v2.0

; Set ups and privilege check

setUp(){
    ; Launch as admin
    #SingleInstance prompt

    full_command_line := DllCall("GetCommandLine", "str")

    if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!`S)")){
        try
        {
            if A_IsCompiled
                Run '*RunAs "' A_ScriptFullPath '" /restart'
            else
                Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
        }
        ExitApp
    }

    InstallKeybdHook
    SendMode "Input"
    SetCapsLockState "AlwaysOff"
    A_MaxHotkeysPerInterval := 2000    ; increase the limit to meet fighting games needs
    menuSetUp()
}

menuSetUp(){
    ; Tray Menu
    global Tray:= A_TrayMenu
    Tray.Delete()
    Tray.Add("About", about)
    Tray.Add("WinLock", WinKeyToggle)
    Tray.Add("Pause", pauseToggle)
    Tray.Add("Exit", exitFunc)
    Tray.Check("WinLock")
}



; Menu Functions

about(*){
    MsgBox("SCOD - LastInputPriorty [L/R]`nAuthor: jjin43`n`nCurrent Key Binds:`nLeft: [ " left " ]`t`tRight: [ " right " ]`t`tUp: [ " up " ]`t`tDown: [ " down " ]`n" pauseButton ": Pause Script`n" exitButton ": Exit Script`n`nBoth [WindowsKey] and [Caplock] are turned off when scrpit is running.`n`nAutoHotKey v2.0`nPersonal Open-Source Project.", "SCOD - LIP:  Help", 0)
}

pauseToggle(*){
    
    ; graceful pause to prevent interrupting current thread and causing stuck keys, just need to wait for current thread to finish
    if(A_IsPaused)
        Tray.Uncheck("Pause")
    else
        Tray.Check("Pause")
    Pause -1
}

exitFunc(*){
    ; graceful exit
    ExitApp
}

WinKeyToggle(*){
    global winLock
    if (winLock=0){
        Hotkey lWin, "On"
        Hotkey rWin, "On"
        winLock:=1
        Tray.Check("WinLock")
    }
    else{
        Hotkey lWin, "Off"
        Hotkey rWin, "Off"
        winLock:=0
        Tray.Uncheck("WinLock")
    }
    
}