; SunAwtFrame is the ahk window class of OR
; SunAwtDialog is the ahk window class of OR's "open file" dialog

; this program takes 1 argument: the path to the .ork file to be opened
; let us call this file "file.ork"

; IMPORTANT: path to "OpenRocket.exe"; must modify manually
ORPATH := '"C:\Program Files\OpenRocket\OpenRocket.exe" '

if WinExist("ahk_class SunAwtFrame") { ; if OR is open
    WinActivate("ahk_class SunAwtFrame") ; activate OR

    winid := WinGetID("A") ; store the window ID of the current OR window into "winid"
    ; this is so I can close that window later to prevent windows piling up
    ; since every time a file is opened in OR, a new window is created

    Send "^o" ; send [ctrl] + "o" to OR; this is the shortcut for "open file"
    WinWait("ahk_class SunAwtDialog") ; wait until the "open file dialog appears"

    SendText A_Args[1] ; enter the path to "file.ork"
    Send "{Enter}" ; send [enter] to the dialog; this opens the file

    WinWaitNotActive(winid) ; wait until the new window is active (until the old window is no longer active)
    if WinActive("ahk_class SunAwtDialog") { ; if a loading dialog appears
        WinWaitNotActive ; wait until it ends
    }
    WinWaitNotActive(winid) ; wait until the new window is active (until the old window is no longer active)

    WinClose(winid) ; close the old window

} else  { ; if OR is not open
    Run(ORPATH . A_Args[1]) ; run OR with the path to "file.ork" as an argument; this opens that file
    WinWait("ahk_class SunAwtFrame") ; wait until OR is open
}

Esc::ExitApp ; emergency program exit bound to [esc]; to force exit this script, press [esc]

ExitApp ; exits the script when everything is done
