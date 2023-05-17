; !!! IMPORTANT !!!
; These let you update and reload your config on the fly
; They are super, SUPER IMPORTANT
; (They also only work if you're running an .ahk file, not a compiled .exe)
; Win+Alt+.
#!.::AlertedReload()

; Win+Alt+,
; #!,::Edit

; Win+Alt+,
#!,::PrototypeFunction()

;; Reload script with alert.
AlertedReload()
{
  Tooltip("reloading .ahk")
  Reload()
}

;; Function used for prototyping.
PrototypeFunction()
{
  Tooltip("prototyping... .ahk")
}
