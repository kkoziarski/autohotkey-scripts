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
GroupAdd("chat", "ahk_exe ms-teams.exe")

AddShortcut("Run/show/hide Windows Terminal", "Win+Q")
#q::ToggleApp("ahk_exe WindowsTerminal.exe", "wt")

AddShortcut("Run/show/hide KeePassXC", "Win+K")
#k::ToggleApp("ahk_exe KeePassXC.exe", g_ProgramFilesDir . "\KeePassXC\KeePassXC.exe")

AddShortcut("Activate Bluetooth", "Win+B")
#b::Run("ms-settings:connecteddevices") ;%windir%\explorer.exe ms-settings:bluetooth

AddShortcut("Activate terminal", "RCtrl+X")
>^x::GroupActivate("terminal", "R")    ; not needed - use Win+Q instead

AddShortcut("Activate editors", "RCtrl+.")
>^.::GroupActivate("editors", "R")

AddShortcut("Show/Hide Notepad++", "RCtrl+N")
>^n::ToggleApp("ahk_class Notepad++", "") ;C:\Program Files\Notepad++\notepad++.exe

AddShortcut("Show/Hide Visual Studio", "RCtrl+RAlt+V")
>^>!v::ToggleApp("ahk_exe devenv.exe", "") ;"C:\Program Files\Microsoft Visual Studio\2022\Preview\Common7\IDE\devenv.exe"

AddShortcut("Activate outlook", "RCtrl+M")
>^m::GroupActivate("mail", "R")

AddShortcut("Activate File Explorer", "RCtrl+F")
>^f::GroupActivate("files", "R")

AddShortcut("Activate Teams", "RCtrl+T")
>^t::GroupActivate("chat", "R")

; >^>!s::ToggleApp("ahk_exe Spotify.exe", "D:\Software\AutoHotKey\Lib\Spotify.lnk")
