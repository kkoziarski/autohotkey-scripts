;;;;;;;;;;;;;;;;;;;;;;;;;;;helper functions
ShowTrayTip(text) {
    TrayTip(text)
    ; SetTimer(HideToolTip, -2000)
    Sleep 2000   ; Let it display for 3 seconds.
    HideTrayTip()
}

HideTrayTip() {
    TrayTip()  ; Attempt to hide it the normal way.
    if SubStr(A_OSVersion,1,3) = "10." {
        A_IconHidden := true
        Sleep 200  ; It may be necessary to adjust this sleep.
        A_IconHidden := false
    }
}

HideToolTip() {
    ToolTip()
}

; For things that are unique
ToggleApp(app, location) {
    if WinExist(app) {
        if !WinActive(app) {
            WinActivate
        }
        else {
            WinMinimize
        }
    }
    else if location != "" {
        Run location
    }
}
