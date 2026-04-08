#Requires AutoHotkey v2.0
#Include keybinds.ahk

; Key Input Functions
inputLeft(*){
    Critical    ; prevent thread interruption

    While GetKeyState(left, "P"){
        Sleep 10    ;sleep in ms to let keyboard event update
        rState := GetKeyState(right, "P")   ;"P" for physical state, no parameter for logical state

        if(!rState and !GetKeyState(left)){    
            Send "{" right " up}"
            Send "{" left " down}"
        }
        else if (rState and GetKeyState(left)){
            Send "{" left " up}"
            Send "{" right " down}"
        }

    }

    Send "{" left " up}"

}

inputRight(*){
    Critical

    While GetKeyState(right, "P"){
        Sleep 10
        lState := GetKeyState(left, "P")

        if(!lState and !GetKeyState(right)){    
            Send "{" left " up}"
            Send "{" right " down}"
        }
        else if (lState and GetKeyState(right)){
            Send "{" right " up}"
            Send "{" left " down}"
        }

    }

    Send "{" right " up}"
        
}

inputDown(*){
    Critical

    While GetKeyState(down, "P"){

        Sleep 10
        uState := GetKeyState(up, "P")

        if(!uState and !GetKeyState(down)){    
            Send "{" up " up}"
            Send "{" down " down}"
        }
        else if (uState and GetKeyState(down)){
            Send "{" down " up}"
            Send "{" up " down}"
        }

    }

    Send "{" down " up}"

}

inputUp(*){
    Critical

    While GetKeyState(up, "P"){
        Sleep 10
        dState := GetKeyState(down, "P")

        if(!dState and !GetKeyState(up)){    
            Send "{" down " up}"
            Send "{" up " down}"
        }
        else if (dState and GetKeyState(up)){
            Send "{" up " up}"
            Send "{" down " down}"
        }

    }

    Send "{" up " up}"
        
}

doNothing(*){
    Send "{Blind}{vkE8}"
}
