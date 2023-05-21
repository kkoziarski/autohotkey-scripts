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

; Handy function.
; Copies the selected text to a variable while preserving the clipboard.
GetSelectedText() {
    SavedClip := ClipboardAll()
    A_Clipboard := ""
    Send("^c")
    ClipWait(2)
    TempText := A_Clipboard
    A_Clipboard := SavedClip
    SavedClip := ""
    Return TempText
}

 ; Pastes text from a variable while preserving the clipboard.
PutText(MyText) {
    SavedClip := ClipboardAll()
    A_Clipboard := ""           ; For better compatability
    Sleep(20)                   ; with Clipboard History
    A_Clipboard := MyText
    Send("^v")
    Sleep(100)
    A_Clipboard := SavedClip
    SavedClip := ""
}