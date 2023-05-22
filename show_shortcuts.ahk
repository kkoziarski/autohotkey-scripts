;;;;;;;;;;;;;;;;;;;;;;;;;;; Create the popup menu by adding some items to it.
#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.



AddShortcut("Show shortcuts (this)", "RCtrl+/")
>^/::CreateShortcustView()

; Create the window:
CreateShortcustView() {
    ShortcutsGui := Gui("+ToolWindow -Theme", "Shortcuts list")
    ShortcutsGui.OnEvent('Escape', (*) => ShortcutsGui.Destroy())

    ; Create the ListView with two columns, Description and Shortcut:
    ShortcutsLV := ShortcutsGui.Add("ListView", "+Sort r30 w340", ["Description", "Shortcut"])
    
    For item in g_AllShortcuts
        ShortcutsLV.Add(, item.Name, item.Shortcut)

    ShortcutsLV.ModifyCol  ; Auto-size each column to fit its contents.
    ShortcutsGui.Show()
}

AddShortcut(Name, ShortcutCombination) {
    obj := { Name: Name, Shortcut: ShortcutCombination }
    g_AllShortcuts.Push(obj)
}