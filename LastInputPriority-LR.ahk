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
Tray:= A_TrayMenu
Tray.Delete()
Tray.Add("Help", Help)
Tray.Add("Pause Script", PauseScript)
Tray.Add("Exit Script", ExitScript)
SetCapsLockState "AlwaysOff"    ; when caplock is on, the lower case input scauses caplock flickering, turned off permanently
A_MaxHotkeysPerInterval := 1000
SetKeyDelay 0, 20

; ^^^ Settings ^^^


; << To modify keys, modify the following variables AND the hotkey section
left := "a"
right := "d"

running:=1
return


; Move Left
~$a::   ; << modify to desired 'left' key
{
    global reverse := 0
    Critical
    LeftLoop:
        if (!GetKeyState(left, "P")){
            if(GetKeyState(left)){
                Send "{" left " up}"
            }
            return
        }
        else if(GetKeyState(right, "P") and !GetKeyState(right)){
            if(GetKeyState(left))
                Send "{" left " up}"
            Send "{" right " down}"
        }
        else if(!GetKeyState(right, "P") and GetKeyState(right)){
            Send "{" right " up}"
            Send "{" left " down}"
        }
        else if(GetKeyState(left, "P") and !GetKeyState(right, "P") and !GetKeyState(left)){
            if(GetKeyState(right))
                Send "{" right " Up}"
            Send "{" left " down}"
        }
        else if (GetKeyState(left, "P") and GetKeyState(right, "P") and GetKeyState(left)=GetKeyState(right)){
            if(GetKeyState(left))
                Send "{" left " Up}"
            Send "{" right " down}"
        }
        else
            goto LeftLoop
    goto LeftLoop
    
}


; Move Right
~$d::   ; << modify to desired 'right' key
{
    Critical
    RightLoop:
        if (!GetKeyState(right, "P")){
            if(GetKeyState(right)){
                Send "{" right " up}"
            }
            return
        }
        else if(GetKeyState(left, "P") and !GetKeyState(left)){
            if(GetKeyState(right))
                Send "{" right " up}"
            Send "{" left " down}"
        }
        else if(!GetKeyState(left, "P") and GetKeyState(left)){
            Send "{" left " up}"
            Send "{" right " down}"
        }
        else if(GetKeyState(right, "P") and !GetKeyState(left, "P") and !GetKeyState(right)){
            if(GetKeyState(left))
                Send "{" left " Up}"
            Send "{" right " down}"
        }
        else if (GetKeyState(right, "P") and GetKeyState(left, "P") and GetKeyState(right)=GetKeyState(left)){
            if(GetKeyState(right))
                Send "{" right " Up}"
            Send "{" left " down}"
        }
        else
            goto RightLoop
    goto RightLoop
}

; disable windows keys
LWin::Send "{Blind}{vkE8}"
RWin::Send "{Blind}{vkE8}"

; Menu Functions

Help(A_ThisMenuItem, A_ThisMenuItemPos, MyMenu)
{
    MsgBox("SCOB - LastInputPriorty [L/R]`nAuthor: Zow`n`nCurrent Key Binds:`nLeft: [ " left " ]`t`tRight: [ " right " ]`nF9: Pause Script`nF10: Exit Script`n`nBoth [WindowsKey] and [Caplock] are turned off when scrpit is running.`n`nAutoHotKey v2.0`nCommunity opensource project, do not use for commercial purpose.", "SCOB - LIP:  Help", 0)
}

PauseScript(A_ThisMenuItem, A_ThisMenuItemPos, MyMenu)
{
    PauseFunc()
}

PauseFunc(){
    global
    if (running=0){
        running:=1
        Hotkey("a", "On")
        Hotkey("d", "On")
        Hotkey("LWin", "On")
        Hotkey("RWin", "On")
        SetCapsLockState "AlwaysOff"
        Tray.UnCheck("Pause Script")
    }
    else{
        running:=0
        Hotkey("a", "Off")
        Hotkey("d", "Off")
        Hotkey("LWin", "Off")
        Hotkey("RWin", "Off")
        SetCapsLockState "Off"
        Tray.Check("Pause Script")
    }  
    return
}

ExitScript(A_ThisMenuItem, A_ThisMenuItemPos, MyMenu)
{
    ExitApp
}

F9::PauseFunc()
F10::ExitApp