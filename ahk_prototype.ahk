; !!! IMPORTANT !!!
; These let you update and reload your config on the fly
; They are super, SUPER IMPORTANT
; (They also only work if you're running an .ahk file, not a compiled .exe)

AddShortcut("_ Reload", "Win+Alt+.")
#!.::AlertedReload()

Tooltip("<reloaded>")
Sleep(1000)
HideToolTip()

AddShortcut("Prototyping", "Win+Alt+,")
#!,::PrototypeFunction()

;; Reload script with alert.
AlertedReload()
{
  Tooltip("reloading .ahk...")
  Sleep(500)
  Reload()
}

;; Function used for prototyping.
PrototypeFunction()
{
  Tooltip("prototyping... .ahk")
}

ClassicTeamsOfflineToday()
{
  Tooltip("prototyping... .ahk")
  WinActivate("ahk_exe Teams.exe", "")
  Sleep(500)
  if WinActive("ahk_exe Teams.exe") {

    SetKeyDelay(500)

    SendEvent("{Escape 4}") ; discard everything
    SendEvent("^{2}{Escape}") ; activate first tab
    Sleep(500)
    SendEvent("^{.}") ; show shortcuts menu for a moment

    SendEvent("{Escape}{{Enter}{Enter}{Down}{Enter}") ;navigate to status
    SendEvent("{Up 2}{Enter}{Down}{Up}{Enter}{TAB 2}{Enter}") ; set status to offline for today
    Sleep(500)
    ShowTrayTip("status set to offline")

    SetKeyDelay(-1)
  }
  Sleep(1500)
  Tooltip()
}


; DEBUG
; <^>!a::MsgBox "You pressed AltGr+a."

; DEBUG
#HotIf WinActive("ahk_class Notepad")
#Space::MsgBox "You pressed Win+Spacebar in Notepad or "
#HotIf
