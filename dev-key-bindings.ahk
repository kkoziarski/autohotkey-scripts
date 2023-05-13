#SingleInstance Force
SendMode("Input")
SetWorkingDir(A_ScriptDir)

GroupAdd("editors", "ahk_exe Code.exe")
GroupAdd("editors", "ahk_exe devenv.exe")

GroupAdd("terminal", "ahk_exe WindowsTerminal.exe")
GroupAdd("terminal", "ahk_exe powershell.exe")
GroupAdd("terminal", "ahk_exe powershell_ise.exe")

; Win+q: Run/show/hide Windows Terminal.
#q::ToggleApp("ahk_exe WindowsTerminal.exe", "wt")
; Win+K: Run/show/hide KeePassXC
#k::ToggleApp("ahk_exe KeePassXC.exe", g_ProgramFilesDir . "\KeePassXC\KeePassXC.exe")

>^x::GroupActivate("terminal", "R")    ; not needed - use Win+Q instead
>^.::GroupActivate("editors", "R")

; RCtrl+n: Run/show Notepad++
>^n::ToggleApp("ahk_exe notepad++.exe", "C:\Program Files\Notepad++\notepad++.exe")

; RCtrl+v: Run/show/hide Visual Studio
>^v::ToggleApp("ahk_exe devenv.exe", "C:\Program Files\Microsoft Visual Studio\2022\Preview\Common7\IDE\devenv.exe")
