#Requires AutoHotkey v2.0
#SingleInstance force
A_HotkeyModifierTimeout := 100 
;copy-paste hotkeys
F1::^c ; Ctrl + C
F2::^a ; Ctrl + A
F3::^v ; Ctrl + V
F4::^x ; Ctrl + X
Esc::Home
`::End
F9::Reload

F10::DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0) ;hybernate


Tab & q::Browser_Back
Tab & a::Browser_Forward
Tab & w::Scrollup()
Tab & s::ScrollDown()
Tab & e::^Z
Tab & d::^h
Tab & z::^f
Tab & x::^s
Tab & c::^y
Capslock & Esc::!F4
CapsLock & `::^w ;close tab
CapsLock & Tab::^+t ;open prev tab
CapsLock & LShift::^t ;new tab

#Include apps.ahk
#Include media.ahk
#Include restore.ahk
#Include m3.ahk
#Include zoom.ahk
#Include Lib/mouse.ahk
#Include Lib/autocorrect.ahk 
#Include personal.ahk
