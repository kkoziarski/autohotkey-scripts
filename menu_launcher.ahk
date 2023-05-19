; Create the popup menu by adding some items to it.
MyMenu := Menu()
MyMenu.Add "Item 1", MenuHandler
MyMenu.Add "Item 2", MenuHandler
MyMenu.Add  ; Add a separator line.

; Create another menu destined to become a submenu of the above menu.
Submenu1 := Menu()
Submenu1.Add "Item A", MenuHandler
Submenu1.Add "Item B", MenuHandler

; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.
MyMenu.Add "My Submenu", Submenu1

MyMenu.Add  ; Add a separator line below the submenu.
MyMenu.Add "Item 3", MenuHandler  ; Add another menu item beneath the submenu.

MenuHandler(Item, *) {
    MsgBox "You selected " Item
}

#^+z::MyMenu.Show  ; i.e. press the Win-Z hotkey to show the menu.


; Menu "Launch_Menu, Add, Assassin's Creed, Launch_Menu_Handler
; Menu "Launch_Menu, Add, Grid Racing     , Launch_Menu_Handler
; Menu, Launch_Menu, Add, Deadspace       , Launch_Menu_Handler
; Menu, Launch_Menu, Add, Silent Hill     , Launch_Menu_Handler

; Menu, Launch_Menu, Show

; Launch_Menu_Handler:
; {
;     ; If ( A_ThisMenuItem = "Assassin's Creed" )
;     ; {
;     ;     Run, c:\path\to\assassin's creed\game.exe
;     ; }
;     ; Else If ( A_ThisMenuItem = "Grid Racing" )
;     ; {
;     ;     Run, c:\path\to\grid racing\game.exe
;     ; }
;     ; Else If ( A_ThisMenuItem = "Deadspace" )
;     ; {
;     ;     Run, c:\path\to\deadspace\game.exe
;     ; }
;     ; Else If ( A_ThisMenuItem = "Silent Hill" )
;     ; {
;     ;     Run, c:\path\to\slient hill\game.exe
;     ; }
;     ExitApp
; }
; Return