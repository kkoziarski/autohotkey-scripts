
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance Force ; No others
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.
SetKeyDelay(40)
SetTitleMatchMode("RegEx")

<^>!?::ListHotkeys

; Some notes on hotkey modifier symbols
;   (hotkeys are otherwise case insensitive, c:: = C:: ≠ +c::
; # = Winkey
; + = shift
; ^ = ctrl
; ! = alt
; > = RIGHT modifier. >^c is "right ctrl + c" good for not accidentally overriding builtin chords

; !!! IMPORTANT !!!
; These let you update and reload your config on the fly
; They are super, SUPER IMPORTANT
; (They also only work if you're running an .ahk file, not a compiled .exe)
; Win+Alt+.
#!.::Reload

; Win+Alt+,
#!,::Edit

#Include <Helpers>
#Include <ModesModal>
#Include <CharScripts>
#Include hotstrings.ahk
#Include <HotStringAdder>

#Include dev-key-bindings.ahk

; globals for ModesModal.ahk
g_mode := ""

GroupAdd("editors", "ahk_exe Code.exe")
GroupAdd("editors", "ahk_exe devenv.exe")

GroupAdd("terminal", "ahk_exe WindowsTerminal.exe")
GroupAdd("terminal", "ahk_exe powershell.exe")
GroupAdd("terminal", "ahk_exe powershell_ise.exe")

GroupAdd("files", "ahk_class CabinetWClass") ; file explorer

GroupAdd("mail", "ahk_exe outlook.exe")

>^m::GroupActivate("mail", "R")
>^f::GroupActivate("files", "R")
>^x::GroupActivate("terminal", "R")    ; not needed - use Win+Q instead
>^.::GroupActivate("editors", "R")
>^n::ToggleApp("ahk_exe notepad++.exe", "C:\Program Files\Notepad++\notepad++.exe")
>^v::ToggleApp("ahk_exe devenv.exe", "C:\Program Files\Microsoft Visual Studio\2022\Preview\Common7\IDE\devenv.exe")

; available shortcuts
; >!p::
; >!l::

; Format copy as markdown link
; 1 - copy URL to clipboard
; 2 - select text to be link text
#!c::{
    cp_url := A_Clipboard ;current clipboard has url
    A_Clipboard := ""
    Send("^c")
    ClipWait(2)
    A_Clipboard := "[" . A_Clipboard . "](" . cp_url . ")"
}

;RCtrl+LShift+d show current time
>^>+d:: {
    TimeString := FormatTime(, "dd/MM HH:mm")
    Tooltip(TimeString)
    SetTimer(HideToolTip, -1700)
}

; Timestamp tracking
>^d:: {
    TimeString := FormatTime(, "dd/MM/yyyy HH:mm")
    inputObj := InputBox("Timestamp name", "Timestamp name", "w200 h100")
    timestampfile := A_MyDocuments . "\ahk-timestamps.txt"
    if inputObj.Result = "OK" {
        ; MsgBox "You entered '" inputObj.value "'." timestampfile
        t_msg := inputObj.value
        FileAppend(TimeString " " t_msg "`r`n", timestampfile)
        Tooltip("Saved into " timestampfile)
        SetTimer(HideToolTip, -1700)
    }
}

; RCtrl+o: Open current selected file in notepad
#HotIf WinActive("ahk_class CabinetWClass")
    >^o::{
        A_Clipboard := ""
        Send("^c")
        ClipWait(2)
        Run 'notepad.exe "' A_Clipboard '"'
    }
#HotIf


; DEBUG
<^>!a::MsgBox "You pressed AltGr+a."

; DEBUG
#HotIf WinActive("ahk_class Notepad")
    #Space::MsgBox "You pressed Win+Spacebar in Notepad or "
#HotIf

; >^>!s::ToggleApp("ahk_exe Spotify.exe", "D:\Software\AutoHotKey\Lib\Spotify.lnk")

