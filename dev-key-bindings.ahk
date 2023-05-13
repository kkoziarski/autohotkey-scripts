#SingleInstance Force
SendMode("Input")
SetWorkingDir(A_ScriptDir)

SwitchToWindowsTerminal() {
  windowHandleId := WinExist("ahk_exe WindowsTerminal.exe")
  windowExistsAlready := windowHandleId > 0

  ; If the Windows Terminal is already open, determine if we should put it in focus or minimize it.
  if (windowExistsAlready = true)
  {
    activeWindowHandleId := WinExist("A")
    windowIsAlreadyActive := activeWindowHandleId == windowHandleId

    if (windowIsAlreadyActive)
    {
      ; Minimize the window.
      WinMinimize(windowHandleId)
    }
    else
    {
      ; Put the window in focus.
      WinActivate(windowHandleId)
      WinShow(windowHandleId)
    }
  }
  ; Else it's not already open, so launch it.
  else
  {
    Run "wt"
  }
}
; Hotkey to use Win+q to launch/restore the Windows Terminal.
; #q::SwitchToWindowsTerminal()

SwitchToKeePassXC() {
  windowHandleId := WinExist("ahk_exe KeePassXC.exe")
  windowExistsAlready := windowHandleId > 0

  ; If the KeePassXC is already open, determine if we should put it in focus or minimize it.
  if (windowExistsAlready = true)
  {
    activeWindowHandleId := WinExist("A")
    windowIsAlreadyActive := activeWindowHandleId == windowHandleId

    if (windowIsAlreadyActive)
    {
      ; Minimize the window.
      WinMinimize(windowHandleId)
    }
    else
    {
      ; Put the window in focus.
      WinActivate(windowHandleId)
      WinShow(windowHandleId)
    }
  }
  ; Else it's not already open, so launch it.
  else
  {
    ProgramFilesDir := EnvGet(A_Is64bitOS ? "ProgramW6432" : "ProgramFiles")
    Run ProgramFilesDir . "\KeePassXC\KeePassXC.exe"
  }
}

; Win+q: Run/show/hide Windows Terminal.
#q::SwitchToWindowsTerminal()
; Win+K: Run/show/hide KeePassXC
#k::SwitchToKeePassXC()

; Run/show/hide KeePassXC using Win+K
; #K::SwitchToKeePassXC()