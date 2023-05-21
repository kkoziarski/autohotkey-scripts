;;;;;;;;;;;;;;;;;;;;;;;;;;; RCtrl+p - translate selected text
#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

AddShortcut("Translate selected text", "RCtrl+P")
>^p::{
    tmpTxt := GetSelectedText()
    Run("https://www.deepl.com/translator#en/pl/" tmpTxt)
}
