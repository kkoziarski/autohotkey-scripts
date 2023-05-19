#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

;Win+Alt+c Format copy as markdown link
; 1 - copy URL to clipboard
; 2 - select text to be link text.
#!c::{
    cp_url := A_Clipboard ;current clipboard has url
    A_Clipboard := ""
    Send("^c")
    ClipWait(2)
    A_Clipboard := "[" . A_Clipboard . "](" . cp_url . ")"
}
