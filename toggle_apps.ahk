#SingleInstance Force
SendMode("Input")
SetWorkingDir(A_ScriptDir)

GroupAdd("editors", "ahk_exe Code.exe")
GroupAdd("editors", "ahk_exe devenv.exe")

GroupAdd("terminal", "ahk_exe WindowsTerminal.exe")
GroupAdd("terminal", "ahk_exe powershell.exe")
GroupAdd("terminal", "ahk_exe powershell_ise.exe")

GroupAdd("files", "ahk_class CabinetWClass") ; file explorer
GroupAdd("mail", "ahk_exe OUTLOOK.EXE")
GroupAdd("chat", "ahk_exe Teams.exe")

; Win+q: Run/show/hide Windows Terminal.
#q::ToggleApp("ahk_exe WindowsTerminal.exe", "wt")
; Win+K: Run/show/hide KeePassXC
#k::ToggleApp("ahk_exe KeePassXC.exe", g_ProgramFilesDir . "\KeePassXC\KeePassXC.exe")

>^x::GroupActivate("terminal", "R")    ; not needed - use Win+Q instead
>^.::GroupActivate("editors", "R")

; RCtrl+n: Run/show Notepad++
>^n::ToggleApp("ahk_class Notepad++", "") ;C:\Program Files\Notepad++\notepad++.exe

; RCtrl+v: Run/show/hide Visual Studio
>^>!v::ToggleApp("ahk_exe devenv.exe", "") ;"C:\Program Files\Microsoft Visual Studio\2022\Preview\Common7\IDE\devenv.exe"

>^m::GroupActivate("mail", "R")
>^f::GroupActivate("files", "R")
>^t::GroupActivate("chat", "R")

; >^>!s::ToggleApp("ahk_exe Spotify.exe", "D:\Software\AutoHotKey\Lib\Spotify.lnk")
