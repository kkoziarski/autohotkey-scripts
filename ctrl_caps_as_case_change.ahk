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

; CaseConvertMenu.Disable("Fix Linebreaks")

g_case_TempText := ""

^CapsLock::{
   global g_case_TempText
   g_case_TempText := GetSelectedText()
   CaseConvertMenu.Show()
}

CapsMenuHandler(ItemName, *) {
   global g_case_TempText
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
      Temp2 := StrReplace(Temp2, Chr(29), "`r`n")
      g_case_TempText := Temp2
   }
   PutText(g_case_TempText)
}

; Original: https://github.com/GorvGoyl/Autohotkey-Scripts-Windows/blob/master/ctrl_caps_as_case_change.ahk