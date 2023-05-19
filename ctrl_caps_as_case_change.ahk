; ctrl+capslock to show text case change menu 

#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

; Create the popup menu by adding some items to it.
CaseConvertMenu := Menu()
CaseConvertMenu.Add("&UPPERCASE", CapsMenuHandler)
CaseConvertMenu.Add("&lowercase", CapsMenuHandler)
CaseConvertMenu.Add("&Title Case", CapsMenuHandler)
CaseConvertMenu.Add("&Sentence case", CapsMenuHandler)
CaseConvertMenu.Add()  ; Add a separator line.
CaseConvertMenu.Add("Fix Linebreaks", CapsMenuHandler)
CaseConvertMenu.Add("Reverse", CapsMenuHandler)

CaseConvertMenu.Disable("Fix Linebreaks")
CaseConvertMenu.Disable("Reverse")

g_case_TempText := ""

^CapsLock::{
   global g_case_TempText
   g_case_TempText := GetSelectedText()
   CaseConvertMenu.Show()
}

CapsMenuHandler(ItemName, *) {
   ; g_case_TempText := g_case_TempText
   global g_case_TempText
   ; Tooltip("copied text" g_case_TempText)
   If (ItemName = "&UPPERCASE")
      g_case_TempText := StrUpper(g_case_TempText)
   Else If (ItemName = "&lowercase")
      g_case_TempText := StrLower(g_case_TempText)
   Else If (ItemName = "&Title Case")
      g_case_TempText := StrTitle(g_case_TempText)
   Else If (ItemName = "&Sentence case")
   {
      g_case_TempText := StrLower(g_case_TempText)
      g_case_TempText := RegExReplace(g_case_TempText, "((?:^|[.!?]\s+)[a-z])", "$u1")
   }
   Else If (ItemName = "Fix Linebreaks")
   {
      g_case_TempText := RegExReplace(g_case_TempText, "\R", "`r`n")
   }
   Else If (ItemName = "Reverse")
   {
      Temp2 := ""
      g_case_TempText := StrReplace(g_case_TempText, "`r`n", Chr(29))
      Loop Parse, g_case_TempText
         Temp2 := A_LoopField . Temp2
      Temp2 := StrReplace(g_case_TempText, Chr(29), "`r`n")
   }
   PasteText(g_case_TempText)
}

; Handy function.
; Copies the selected text to a variable while preserving the clipboard.
GetSelectedText() {
   SavedClip := ClipboardAll()
   A_Clipboard := ""
   Send("^c")
   ClipWait(2)
   TempText := A_Clipboard
   A_Clipboard := SavedClip
   SavedClip := ""
   Return TempText
}

; Pastes text from a variable while preserving the clipboard.
PasteText(MyText) {
   SavedClip := ClipboardAll()
   A_Clipboard := ""           ; For better compatability
   Sleep(20)                   ; with Clipboard History
   A_Clipboard := MyText
   Send("^v")
   Sleep(100)
   A_Clipboard := SavedClip
   SavedClip := ""
}

; Original: https://github.com/GorvGoyl/Autohotkey-Scripts-Windows/blob/master/ctrl_caps_as_case_change.ahk