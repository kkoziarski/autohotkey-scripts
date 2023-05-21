;;;;;;;;;;;;;;;;;;;;;;;;;;; Create the popup menu by adding some items to it.
#SingleInstance Force       ; No others
SendMode("Input")           ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

MyMenu := Menu()
MyMenu.Add("Item 1", MenuHandler)
MyMenu.Add("Item 2", MenuHandler)
MyMenu.Add()  ; Add a separator line.

; Create another menu destined to become a submenu of the above menu.
Submenu1 := Menu()
Submenu1.Add("Item A", MenuHandler)
Submenu1.Add("Item B", MenuHandler)

; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.
MyMenu.Add("My Submenu", Submenu1)

MyMenu.Add() ; Add a separator line below the submenu.
MyMenu.Add("Item 3", MenuHandler)  ; Add another menu item beneath the submenu.

MyMenu.Add("Script Icon", MenuHandler)
MyMenu.Add("Suspend Icon", MenuHandler)
MyMenu.Add("Pause Icon", MenuHandler)
MyMenu.SetIcon("Script Icon", A_AhkPath, 2) ; 2nd icon group from the file
MyMenu.SetIcon("Suspend Icon", A_AhkPath, -206) ; icon with resource ID 206
MyMenu.SetIcon("Pause Icon", A_AhkPath, -207) ; icon with resource ID 207

MenuHandler(ItemName, *) {
    MsgBox "You selected " ItemName
}

#^+z::MyMenu.Show  ; i.e. press the Win-Z hotkey to show the menu.
