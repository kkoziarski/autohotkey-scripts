;;;;;;;;;;;;;;;;;;;;;;;;;;; Show current time && Timestamp tracking
#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

; AddShortcut("Show current time", "RCtrl+RShift+D")
; >^>+d:: {
;     TimeString := FormatTime(, "dd/MM HH:mm")
;     Tooltip(TimeString)
;     SetTimer(HideToolTip, -1700)
; }

AddShortcut("Show last timestamps", "RCtrl+RShift+D")
>^>+d:: {
    timestampfile := A_MyDocuments . "\ahk-timestamps.txt"
    if !FileExist(timestampfile) {
        MsgBox("No timestamps file found")
        return
    }
    content := FileRead(timestampfile)
    lines := StrSplit(content, "`n", "`r")
    ; Remove empty lines from the end
    while (lines.Length > 0 && lines[lines.Length] = "")
        lines.Pop()
    ; Get last 20 lines
    startIndex := Max(1, lines.Length - 19)
    result := ""
    loop lines.Length - startIndex + 1 {
        if (result != "")
            result .= "`n"
        result .= lines[startIndex + A_Index - 1]
    }
    
    timestampGui := Gui("+AlwaysOnTop", "Last 20 Timestamps")
    timestampGui.SetFont("s10", "Consolas")
    timestampGui.Add("Edit", "r30 w600 ReadOnly", result)
    timestampGui.Add("Button", "Default w80", "Close").OnEvent("Click", (*) => timestampGui.Destroy())
    timestampGui.OnEvent("Escape", (*) => timestampGui.Destroy())
    timestampGui.Show()
}

AddShortcut("Timestamp tracking", "RCtrl+D")
>^d:: {
    TimeString := FormatTime(, "dd/MM/yyyy HH:mm")
    IB := InputBox("Timestamp name", "Timestamp name", "w200 h100")
    timestampfile := A_MyDocuments . "\ahk-timestamps.txt"
    if IB.Result = "OK" {
        t_msg := IB.value
        FileAppend(TimeString " " t_msg "`r`n", timestampfile)
        Tooltip("Saved into " timestampfile)
        SetTimer(HideToolTip, -1700)
    }
}
