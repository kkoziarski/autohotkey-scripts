#Requires AutoHotkey v2.0

; Audio Device Switcher - AutoHotkey v2
; Win+F12 = Sound Control Panel, F11 = Try Auto Switch


; Using Win+F12 and Win+F11 with device selection
#F12:: {
    SwitchAudioDevice("first")
}

#F11:: {
    SwitchAudioDevice("second")
}

; Reusable function to switch audio devices
; Parameter: devicePosition - "first" for first device, "second" for second device, etc.
SwitchAudioDevice(devicePosition) {
    Send("^#v")  ; Open Sound Control
    Sleep(1000)
    
    ; Navigate to the correct device based on parameter
    if (devicePosition = "second") {
        Send("{Down}")  ; Navigate to second device
        Sleep(200)
    } else if (devicePosition = "third") {
        Send("{Down}{Down}")  ; Navigate to third device
        Sleep(200)
    } else if (devicePosition = "fourth") {
        Send("{Down}{Down}{Down}")  ; Navigate to fourth device
        Sleep(200)
    }
    ; For "first" device, no Down arrows needed
    
    Send("{Enter}")  ; Select the device
    Sleep(500)
    ; Send("{Escape}") ; Close Sound Control
    
    ToolTip("Switched to " . devicePosition . " audio device")
    SetTimer(ClearToolTip, 2000)
}

; ; Using F11 - attempts to cycle through devices
; #F12:: {
;     Send("^#v")  ; Open Sound Control
;     Sleep(1000)
;     Send("{Enter}")  ; Open audio dropdown
;     Sleep(500)
;     Send("{Escape}") ; Close Game Bar
    
;     ToolTip("Attempted device switch via Sound Control Panel")
;     SetTimer(ClearToolTip, 2000)
; }

; #F11:: {
;     ; Alternative: Use Windows Game Bar quick switcher (if available)
;     Send("^#v")  ; Open Sound Control
;     Sleep(1000)
;     Send("{Down}")  ; Navigate to audio selector
;     Sleep(200)
;     Send("{Enter}")  ; Open audio dropdown
;     Sleep(500)
;     Send("{Escape}") ; Close Game Bar
    
;     ToolTip("Attempted device switch via Sound Control Panel")
;     SetTimer(ClearToolTip, 2000)
; }

; Method 1: Open Sound Control Panel (most reliable)
; Using Win+F12 - safe combination
; #F12:: {
;     Run("mmsys.cpl")  ; Opens Sound control panel
;     WinWaitActive("Sound")
;     ; Focus on Playback tab (should be default)
;     Send("{Tab}")
;     ; You can now use arrow keys to select device and Enter to set as default
; }

; ; Method 2: Try native PowerShell switching (Windows 10/11)
; ; Using F11 - attempts to cycle through devices
; #F12:: {
;     ; Alternative: Use Windows Game Bar quick switcher (if available)
;     Send("#g")  ; Open Game Bar
;     Sleep(1000)
;     Send("{Tab}")  ; Navigate to audio selector
;     Sleep(200)
;     Send("{Enter}")  ; Open audio dropdown
;     Sleep(200)
;     Send("{Down}")   ; Select next device
;     Send("{Enter}")  ; Confirm
;     Sleep(500)
;     ; Send("{Escape}") ; Close Game Bar
    
;     ToolTip("Attempted device switch via Game Bar")
;     SetTimer(ClearToolTip, 2000)
; }

; ; Method 3: Using Windows+G Game Bar approach (simpler)
; ; Using Ctrl+Win+F3 
; ^#F3:: {
;     Send("#g")  ; Open Windows Game Bar
;     Sleep(1500)
;     ; The Game Bar has an audio switcher widget
;     ; You can navigate with Tab and use the audio dropdown
;     Send("{Tab}")
;     Sleep(200)
;     ToolTip("Game Bar opened - use audio widget")
;     SetTimer(ClearToolTip, 3000)
; }

; ; Method 2: Alternative hotkey that tries to switch automatically
; ; Using Win+F11 - simple function key
; #F11:: {
;     ; Open Sound settings (Windows 10/11)
;     Run("ms-settings:sound")
;     Sleep(1000)
;     WinActivate("Settings")
;     ; Navigate to output device dropdown
;     Send("{Tab}{Tab}{Tab}{Tab}")  ; May need adjustment based on your Windows version
;     ; Send("{Enter}")  ; Open dropdown
;     ; Send("{Tab}")   ; Select next device
;     ; Send("{Enter}")  ; Confirm selection
;     Sleep(500)
;     ; Send("{Tab}")   ; Select next device

;     ; WinClose("Settings")
;     ToolTip("Audio device switched")
;     SetTimer(ClearToolTip, 2000)
; }

; ; Method 3: Quick access to volume mixer
; ; Using Ctrl+Win+F3 - alternative
; ^#F3:: {
;     Run("sndvol.exe")  ; Opens Volume Mixer
; }

ClearToolTip() {
    ToolTip()
}

; Show available hotkeys on startup
ToolTip("Audio Switcher loaded:`nWin+F12 = Sound Control Panel`nF11 = Try Auto Switch`nCtrl+Win+F3 = Volume Mixer")
SetTimer(ClearStartupTip, 5000)

ClearStartupTip() {
    ToolTip()
}