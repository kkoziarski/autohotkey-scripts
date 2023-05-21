;;;;;;;;;;;;;;;;;;;;;;;;;;; RCtrl+o: Open current selected file in notepad
#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

AddShortcut("Open file in notepad", "RCtrl+O")
#HotIf WinActive("ahk_class CabinetWClass")
    >^o::{
        A_Clipboard := ""
        Send("^c")
        ClipWait(2)
        Run 'notepad.exe "' A_Clipboard '"'
    }
#HotIf




