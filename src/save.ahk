; saves simulation results on OR

if WinActive("ahk_class SunAwtFrame") { ; if OR is the active window
    Send "^s" ; send [ctrl] + "s" to OR; this is the shortcut for "save file"
    Sleep(200) ; wait a bit; wait time is in miliseconds

    ; a dialog may or may not show up
    ; this dialog asks if you want to save all simulation data or only summary data
    ; the default is all simulation data, so if it shows up, we just click "ok"
    if(WinExist("ahk_class SunAwtDialog")) { ; if the dialog shows up
        Send "{Enter}" ; send [enter] to click "ok"
    }

    Sleep(1000) ; wait 1 second; during this time, if the file has not finished saving, a loading dialog should show up
    if(WinExist("ahk_class SunAwtDialog")) { ; if the loading dialog shows up
        WinWaitNotActive ; wait until it finishes
    }
}

Esc::ExitApp ; emergency exit script button bound to [esc]

ExitApp ; exit the script when everything is done
