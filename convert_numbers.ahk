#Requires AutoHotkey v2.0

#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.

; Hotkey: Ctrl+Alt+V to convert and paste numbers
AddShortcut("Convert numbers", "Ctrl+Alt+V")
^!v:: {  ; Ctrl+Shift+V
    original := A_Clipboard
    
    if (original = "") {
        return
    }
    
    ; Convert numbers: remove spaces, replace commas with dots
    converted := RegExReplace(original, "(\d)[\s\h](?=\d)", "$1")  ; Remove spaces between digits
    converted := RegExReplace(converted, "(\d),(?=\d)", "$1.")     ; Replace comma with dot between digits
    
    ; Temporarily store converted text in clipboard
    A_Clipboard := converted
    
    ; Paste the converted text
    Send "^v"
    
    ; Wait a moment then restore original clipboard
    Sleep 200
    A_Clipboard := original
}