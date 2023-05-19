
#Warn                       ; Enable warnings to assist with detecting common errors.
#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.
SetKeyDelay(40)
SetTitleMatchMode("RegEx")

;LCtrl+RAlt+? - show hotkeys
<^>!?::ListHotkeys

; Some notes on hotkey modifier symbols
;   (hotkeys are otherwise case insensitive, c:: = C:: ≠ +c::
; # = Winkey
; + = shift
; ^ = ctrl
; ! = alt
; > = RIGHT modifier. >^c is "right ctrl + c" good for not accidentally overriding builtin chords

; globals for ModesModal.ahk
g_mode := ""

g_ProgramFilesDir := EnvGet(A_Is64bitOS ? "ProgramW6432" : "ProgramFiles")

#Include <Helpers>
#Include <ModesModal>
#include ahk_prototype.ahk                  ; script reloading
#Include hotstrings.ahk                     ; defined hotstrings
#include hotstring_add_new_modal.ahk        ; add new hotstring dynamically
#include chars_superscripts_sender.ahk      ; send ² or ₂

#Include key_remap.ahk

#Include copy_as_markdown.ahk
#Include open_file_in_notepad.ahk
#Include timestamps.ahk
#Include toggle_apps.ahk
#Include translate_selected_text.ahk
#Include create_file_here.ahk

#Include menu_launcher.ahk
