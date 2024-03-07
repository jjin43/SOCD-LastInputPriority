#SingleInstance prompt
; Launch as admin
full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!`S)"))
{
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
A_MaxHotkeysPerInterval := 1000
SetKeyDelay 0, 20
Tray:= A_TrayMenu
Tray.Delete()
Tray.Add("Pause Script", PauseScript)
Tray.Add("Exit Script", ExitScript)
SetCapsLockState "AlwaysOff"    ; when caplock is on, the lower case input scauses caplock flickering, turned off permanently


down := "s"     ; << modify to desired 'down' key
up := "space"   ; << modify to desired 'up' key

running:=1
return

~$s::   ; << modify to desired 'down' key
{
    Critical
    DownLoop:
        if (!GetKeyState(down, "P")){
            if(GetKeyState(down)){
                Send "{" down " up}"
            }
            return
        }
        else if(GetKeyState(up, "P") and !GetKeyState(up)){
            if(GetKeyState(down))
                Send "{" down " up}"
            Send "{" up " down}"
        }
        else if(!GetKeyState(up, "P") and GetKeyState(up)){
            Send "{" up " up}"
            Send "{" down " down}"
        }
        else if(GetKeyState(down, "P") and !GetKeyState(up, "P") and !GetKeyState(down)){
            if(GetKeyState(up))
                Send "{" up " up}"
            Send "{" down " down}"
        }
        else if (GetKeyState(down, "P") and GetKeyState(up, "P") and GetKeyState(down)=GetKeyState(up)){
            if(GetKeyState(down))
                Send "{" down " up}"
            Send "{" up " down}"
        }
        else
            goto DownLoop
    goto DownLoop
    
}

Help(A_ThisMenuItem, A_ThisMenuItemPos, MyMenu)
{
    MsgBox("SCOB - LastInputPriorty [U/D]`nAuthor: Zow`n`nCurrent Key Binds:`nDown: [ " up " ]`t`tUp: [ " down " ]`nF9: Pause Script`nF10: Exit Script`n`nBoth [WindowsKey] and [Caplock] are turned off when scrpit is running.`n`nAutoHotKey v2.0`nCommunity opensource project, do not use for commercial purpose.", "SCOB - LIP:  Help", 0)
}

ExitScript(A_ThisMenuItem, A_ThisMenuItemPos, MyMenu)
{
    ExitApp
}

PauseScript(A_ThisMenuItem, A_ThisMenuItemPos, MyMenu)
{
    PauseFunc()
}

PauseFunc(){
    global
    if (running=0){
        running:=1
        Hotkey("s", "On")
        SetCapsLockState "AlwaysOff"
        Tray.UnCheck("Pause Script")
    }
    else{
        running:=0
        Hotkey("s", "Off")
        SetCapsLockState "Off"
        Tray.Check("Pause Script")
    }  
    return
}

F9::PauseFunc()
F10::ExitApp