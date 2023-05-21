;;;;;;;;;;;;;;;;;;;;;;;;;;; add new hostring to current 'Hotstrings.ahk' file
#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

AddShortcut("Add new hotstring", "RCtrl+H")
>^h::  ; RCtrl+h hotkey
{
    ; Get the text currently selected. The clipboard is used instead of
    ; EditGetSelectedText because it works in a greater variety of editors
    ; (namely word processors).  Save the current clipboard contents to be
    ; restored later. Although this handles only plain text, it seems better
    ; than nothing:
    ClipboardOld := A_Clipboard
    A_Clipboard := "" ; Must start off blank for detection to work.
    Send "^c"
    if !ClipWait(1)  ; ClipWait timed out.
    {
        A_Clipboard := ClipboardOld ; Restore previous contents of clipboard before returning.
        return
    }
    ; Replace CRLF and/or LF with `n for use in a "send-raw" hotstring:
    ; The same is done for any other characters that might otherwise
    ; be a problem in raw mode:
    ClipContent := StrReplace(A_Clipboard, "``", "````")  ; Do this replacement first to avoid interfering with the others below.
    ClipContent := StrReplace(ClipContent, "`r`n", "``n")
    ClipContent := StrReplace(ClipContent, "`n", "``n")
    ClipContent := StrReplace(ClipContent, "`t", "``t")
    ClipContent := StrReplace(ClipContent, "`;", "```;")
    A_Clipboard := ClipboardOld  ; Restore previous contents of clipboard.
    ShowInputBox(":T:`::" ClipContent)

    ShowInputBox(DefaultValue)
    {
        ; This will move the input box's caret to a more friendly position:
        SetTimer MoveCaret, 10
        ; Show the input box, providing the default hotstring:
        IB := InputBox("
        (
        Type your abreviation at the indicated insertion point. You can also edit the replacement text if you wish.

        Example entry: :T:btw`::by the way
        )", "New Hotstring",, DefaultValue)
        if IB.Result = "Cancel"  ; The user pressed Cancel.
            return

        if RegExMatch(IB.Value, "(?P<Label>:.*?:(?P<Abbreviation>.*?))::(?P<Replacement>.*)", &Entered)
        {
            if !Entered.Abbreviation
                MsgText := "You didn't provide an abbreviation"
            else if !Entered.Replacement
                MsgText := "You didn't provide a replacement"
            else
            {
                Hotstring Entered.Label, Entered.Replacement  ; Enable the hotstring now.
                ; hotstring_file := A_ScriptFullPath
                hotstring_file := A_WorkingDir . "\Hotstrings.ahk"
                FileAppend "`n" IB.Value, hotstring_file  ; Save the hotstring for later use.
            }
        }
        else
            MsgText := "The hotstring appears to be improperly formatted"

        if IsSet(MsgText)
        {
            Result := MsgBox(MsgText ". Would you like to try again?",, 4)
            if Result = "Yes"
                ShowInputBox(DefaultValue)
        }
        
        MoveCaret()
        {
            WinWait "New Hotstring"
            ; Otherwise, move the input box's insertion point to where the user will type the abbreviation.
            Send "{Home}{Right 3}"
            SetTimer , 0
        }
    }
}

