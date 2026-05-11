;;;;;;;;;;;;;;;;;;;;;;;;;;; RCtrl+Shift+C: copy selected file path(s) in File Explorer
#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

AddShortcut("Copy selected file path(s)", "RCtrl+Shift+C")
#HotIf WinActive("ahk_class CabinetWClass")
    >^+c::copySelectedFilePaths()
#HotIf

copySelectedFilePaths() {
    savedClip := ClipboardAll()
    selectedPaths := getSelectedExplorerPaths()
    if !selectedPaths {
        A_Clipboard := savedClip
        return
    }

    ; Reassign as plain text so pasted output is a newline-separated path list.
    A_Clipboard := selectedPaths
    ShowTrayTip("Copied selected file path(s)")
}

getSelectedExplorerPaths() {
    winHwnd := WinActive()

    for window in ComObject("Shell.Application").Windows {
        if (window.HWND != winHwnd) {
            continue
        }

        selectedPaths := ""
        for item in window.Document.SelectedItems() {
            if (selectedPaths != "") {
                selectedPaths .= "`r`n"
            }

            selectedPaths .= item.Path
        }

        return selectedPaths
    }

    return ""
}