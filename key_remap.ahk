;;;;;;;;;;;;;;;;;;;;;;;;;;; keys remapping
#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

AddShortcut("Rebind", "CapsLock=>Esc")
Capslock::Esc
AddShortcut("Rebind", "Shift+CapsLock=>CapsLock")
+CapsLock::CapsLock
AddShortcut("Rebind", "Ctrl+Shift+Win+S=>PrintScreen")
^+#S::PrintScreen
;+#F8::PrintScreen
NumpadDot::.
AddShortcut("Rebind", "Alt+J=>Home")
!j::Home
AddShortcut("Rebind", "Alt+K=>End")
!k::End
