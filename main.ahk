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
#Requires AutoHotkey v2.0+

CapsLock:: {
    static isRussian := false
    isRussian := !isRussian
    langCode := isRussian ? "0419" : "0409" ; Toggle between Russian (0419) and English (0409)
    SwitchInputLanguage(langCode)
}

SwitchInputLanguage(langCode) {
    hwnd := WinGetID("A") ; Get the active window's handle
    if !hwnd {
        MsgBox("No active window detected!")
        return
    }
    layout := DllCall("LoadKeyboardLayout", "Str", langCode, "UInt", 1, "Ptr")
    if !layout {
        MsgBox("Failed to load keyboard layout: " langCode)
        return
    }
    PostMessage(0x50, 0, layout, , hwnd) ; WM_INPUTLANGCHANGEREQUEST = 0x50
}

#Include media.ahk
#Include autocorrect.ahk 
#Include restore.ahk
#Include m3.ahk
#Include Lib/mouse.ahk
