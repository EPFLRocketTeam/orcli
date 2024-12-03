; IMPORTANT: position (client) of "Flight simulations" button on the OR GUI; must adjust manually
runButton := "600 70"

if WinExist("ahk_class SunAwtFrame") {
    WinActivate("ahk_class SunAwtFrame")
    Click runButton
    Sleep(100)
    Click runButton
    Sleep(100)
    Loop(3) {
        Send "{Tab}"
        Sleep(20)
    }
    Send "{Enter}"
    WinWait("ahk_class SunAwtDialog")
    WinWaitNotActive("ahk_class SunAwtDialog")
} else  {
    MsgBox "OpenRocket is not open"
}

Esc::ExitApp
ExitApp