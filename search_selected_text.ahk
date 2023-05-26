;;;;;;;;;;;;;;;;;;;;;;;;;;; ; Alt+G : open highlighted text in browser and do google search / visit site (if it's url)
#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

AddShortcut("Open highlighted text in browser", "Alt+G")
!g:: {
    tmpTxt := GetSelectedText()
    If (RegExMatch(tmpTxt, "^[^ ]*\.[^ ]*$"))
    {
        Run("C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe " . tmpTxt)
    }
    Else
    {
        ; Modify some characters that screw up the URL
        ; RFC 3986 section 2.2 Reserved Characters (January 2005):  !*'();:@&=+$,/?#[]
        tmpTxt := StrReplace(tmpTxt, "`r`n", A_Space)
        tmpTxt := StrReplace(tmpTxt, "#", "`%23")
        tmpTxt := StrReplace(tmpTxt, "&", "`%26")
        tmpTxt := StrReplace(tmpTxt, "+", "`%2b")
        tmpTxt := StrReplace(tmpTxt, '"', "`%22")
        Run("https://www.google.com/search?hl=en&q=" . tmpTxt) ; uriEncode(clipboard)
    }
}