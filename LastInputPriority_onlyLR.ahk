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

#SingleInstance Force
InstallKeybdHook
SendMode "Input"
A_MaxHotkeysPerInterval := 1000
SetKeyDelay -1, 20
Tray:= A_TrayMenu
Tray.Delete()
Tray.Add("Help", Help)
Tray.Add("Pause Script", PauseScript)
Tray.Add("Exit Script", ExitScript)



; << To modify keys, modify the following variables AND the hotkey section
left := "a"
right := "d"

updownEnabled:=0
running:=1
return



~$a::   ; << modify to desired 'left' key
{
    Critical
    while (true){
        if (!GetKeyState(left, "P")){
            return
        }
        else if(GetKeyState(right, "P") and !GetKeyState(right)){
            Send "{" left " up}"
            Send "{" right " down}"
        }
        else if(!GetKeyState(right, "P") and GetKeyState(right)){
            Send "{" right " up}"
            Send "{" left " down}"
        }
    }
}

~$d::   ; << modify to desired 'right' key
{
    Critical
    while (true){
        if (!GetKeyState(right, "P")){
            return
        }
        else if(GetKeyState(left, "P") and !GetKeyState(left)){
            Send "{" right " up}"
            Send "{" left " down}"
        }
        else if(!GetKeyState(left, "P") and GetKeyState(left)){
            Send "{" left " up}"
            Send "{" right " down}"
        }
    }
}


Help(A_ThisMenuItem, A_ThisMenuItemPos, MyMenu)
{
    MsgBox("SCOB - LastInputPriorty [L/R Only Version]`nAuthor: Zow`n`nCurrent Key Binds:`nLeft: [ " left " ]`t`tRight: [ " right " ]`nF9: Pause Script`nF10: Exit Script`n`nAutoHotKey v2.0`nCommunity opensource project, do not use for commercial purpose.", "SCOB - LIP:  Help", 0)
}

PauseScript(A_ThisMenuItem, A_ThisMenuItemPos, MyMenu)
{
    PauseFunc()
}

PauseFunc(){
    global
    if (running=0)
        {
            running:=1
            Hotkey("a", "On")
            Hotkey("d", "On")
            Tray.UnCheck("Pause Script")
        }
        else
        {
            running:=0
            Hotkey("a", "Off")
            Hotkey("d", "Off")
            Tray.Check("Pause Script")
        }  
        return
}

ExitScript(A_ThisMenuItem, A_ThisMenuItemPos, MyMenu)
{
    ExitApp()
}

F9::PauseFunc()
F10::ExitApp