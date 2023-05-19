#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

; RCtrl+p - translate selected text
>^p::{
    A_Clipboard := ""
    Send("^c")
    ClipWait(2)
    Run("https://www.deepl.com/translator#en/pl/" A_Clipboard)
}
