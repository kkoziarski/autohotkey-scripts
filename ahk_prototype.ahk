; !!! IMPORTANT !!!
; These let you update and reload your config on the fly
; They are super, SUPER IMPORTANT
; (They also only work if you're running an .ahk file, not a compiled .exe)

AddShortcut("Reload", "Win+Alt+.")
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

; DEBUG
; <^>!a::MsgBox "You pressed AltGr+a."

; DEBUG
#HotIf WinActive("ahk_class Notepad")
    #Space::MsgBox "You pressed Win+Spacebar in Notepad or "
#HotIf
