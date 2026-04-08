#Requires AutoHotkey v2.0
#Include keybinds.ahk


; SOCD Cleaner - Last Input Priority logic
LIP_SOCD(primaryKey, overwriteKey){
    Critical    ; prevent thread interruption

    While GetKeyState(primaryKey, "P"){
        Sleep 10    ;sleep in ms to let keyboard event update

        ;"P" for physical key state, no parameter for logical input state
        primaryActive := GetKeyState(primaryKey)
        overwritePressed := GetKeyState(overwriteKey, "P")

        ; down = pressed down, up = released
        if(!overwritePressed and !primaryActive){    
            Send "{" overwriteKey " up}"
            Send "{" primaryKey " down}"
        }
        else if (overwritePressed and primaryActive){
            Send "{" primaryKey " up}"
            Send "{" overwriteKey " down}"
        }

    }

    Send "{" primaryKey " up}"

}


DoNothing(*){
    Send "{Blind}{vkE8}"
}
