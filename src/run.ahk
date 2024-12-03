; IMPORTANT: position (client) of "Flight simulations" button on the OR GUI; must adjust manually
runButton := "600 70"

if WinExist("ahk_class SunAwtFrame") { ; if OR is open
    WinActivate("ahk_class SunAwtFrame") ; activate the OR window
    Click runButton ; click [Flight simulations]
    Sleep(100) ; wait a bit; time is in miliseconds
    ; wait time is subjective and can be adjusted - these times maximize consistency on my device

    Click runButton ; click [Flight simulations] again
    Sleep(100) ; wait some more

    ; press [tab] 3 times to move selection to [Run simulations]
    Loop(3) { ; 3 times
        Send "{Tab}" ; press [tab]
        Sleep(20) ; wait
    }

    Send "{Enter}" ; press [enter] to run the simulation
    WinWait("ahk_class SunAwtDialog") ; wait until the "running simulations" dialog appears
    WinWaitNotActive("ahk_class SunAwtDialog") ; wait until the "running simulations" dialog disappears
} else  { ; if OR is not open
    MsgBox "OpenRocket is not open" ; show an error message
}

Esc::ExitApp ; emergency exit script button bound to [esc]

ExitApp ; exit script when everything is done
