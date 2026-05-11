;;;;;;;;;;;;;;;;;;;;;;;;;;; ; Clean clipboard on Ctrl+Shift+J: join lines, collapse whitespace, strip BOM
#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

; Reads plain text only (CF_TEXT/CF_UNICODETEXT). Pastes the cleaned result.
AddShortcut("Paste cleaned text", "Ctrl+Shift+J")
^+j:: {
    if !A_Clipboard
        return

    text := A_Clipboard

    ; Remove BOM (UTF-8 BOM = U+FEFF, also U+FFFE)
    text := StrReplace(text, Chr(0xFEFF), "")
    text := StrReplace(text, Chr(0xFFFE), "")

    ; Replace all whitespace runs (spaces, tabs, CR, LF) with single space
    text := RegExReplace(text, "[\s]+", " ")

    ; Trim leading and trailing spaces
    text := Trim(text)

    ; Put cleaned text back and paste
    A_Clipboard := text
    Send "^v"
}