; ctrl+shift+m: create empty text file (NewFile.txt) at current folder location in file explorer

#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

#HotIf WinActive("ahk_class CabinetWClass")
^+m::newFileHere()
#HotIf

newFileHere(){
    ; windows := ""
    ; for window in ComObject("Shell.Application").Windows
    ;     windows .= window.LocationName " :: " window.LocationURL "`n"
    ; MsgBox windows
    WinHWND := WinActive()
    dir := ""
    for window in ComObject("Shell.Application").Windows
        if (window.HWND = WinHWND) {
            dir := SubStr(window.LocationURL, 9) ; remove "file:///"
            dir := RegExReplace(dir, "%20", " ")
            Break
        }

    new_file := dir "/NewFile.txt"
    if FileExist(new_file)
    {
        MsgBox("NewFile.txt already exists")
        return
    }
    FileAppend("", new_file)  ; create new file
}
