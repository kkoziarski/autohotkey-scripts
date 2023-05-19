#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

;RCtrl+LShift+d show current time
>^>+d:: {
    TimeString := FormatTime(, "dd/MM HH:mm")
    Tooltip(TimeString)
    SetTimer(HideToolTip, -1700)
}

; Timestamp tracking
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
