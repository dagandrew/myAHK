#Requires AutoHotkey v2.0
#SingleInstance force

;copy-paste hotkeys
F1::^c ; Ctrl + C
F2::^a ; Ctrl + A
F3::^v ; Ctrl + V
F4::^x ; Ctrl + X
Esc::Home
`::End
;<!1::ClipDiaryPrevious() ;Left Alt + 1
;<!2::ClipDiaryNext() ;Left Alt + 1
;F9::DllCall("PowrProf\SetSuspendState", "int", 1, "int", 1, "int", 1) ;sleep
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

<#LAlt::#^c ;grayscale

<#`::#+s
#Include apps.ahk
#Include zoom.ahk
#Include media.ahk
#Include autocorrect.ahk 
#Include restore.ahk
#Include m3.ahk
#Include Lib/mouse.ahk
#Include personal.ahk
