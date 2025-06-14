#Requires AutoHotkey v2.0

global isExternalMonitor := true

AddShortcut("Toggle monitors", "Win+Shift+Ctrl+M")
; Toggle: Win + Shift + Ctrl + M
#+^m:: {
    global isExternalMonitor
    if isExternalMonitor {
        Run("DisplaySwitch.exe /internal")
        ToolTip("Switched to Laptop Screen")
        global isExternalMonitor := false
    } else {
        Run("DisplaySwitch.exe /external")
        ToolTip("Switched to External Monitor")
        global isExternalMonitor := true
    }
    SetTimer(() => ToolTip(), -1500)
}

AddShortcut("Toggle monitor - external", "Win+Shift+Ctrl+, (<)")
; Force External: Win + Shift + Ctrl + ,
#+^,:: {
    global isExternalMonitor := true
    Run("DisplaySwitch.exe /external")
    ToolTip("Switched to External Monitor")
    SetTimer(() => ToolTip(), -1500)
}

AddShortcut("Toggle monitor - internal", "Win+Shift+Ctrl+. (>)")
; Force Internal: Win + Shift + Ctrl + .
#+^.:: {
    global isExternalMonitor := false
    Run("DisplaySwitch.exe /internal")
    ToolTip("Switched to Laptop Screen")
    SetTimer(() => ToolTip(), -1500)
}
