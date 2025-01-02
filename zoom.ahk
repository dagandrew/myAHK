#Requires AutoHotkey v2.0

ParticipantWindow := "Participants"
AppsKey::Send("{alt down}{a}{alt up}") ;mic 
RCtrl::Send("{alt down}{y}{alt up}") ;hand
Ralt::LowerHands() 

LowerHands(){
; Step 1: Open Participants Window
    SetTitleMatchMode("2")
    if WinExist(ParticipantWindow) {
        WinActivate(ParticipantWindow)
        Sleep(100)
    } else {
        Send("{Alt Down}u{Alt Up}") ; Alt+U toggles Participants window
        Sleep(500) ; Wait for window to open
        ; Step 2: Wait for Participants Window
        if !WinWait(ParticipantWindow, , 5) {
            MsgBox("Participants window not found.")
            return
        }
        ; Step 3: Move Participants Window (Optional)
        WinMove(968, 9, 400, 667, ParticipantWindow) ; Adjust position and size
    }
        ; Step 4: Open "More" Menu (Three Dots)
    CoordMode("Mouse", "Window") ; Set coordinate mode relative to active window
    CoordMode("Pixel", "Window") ; Ensure coordinates are relative to the screen
    MouseClick("Left", 318, 632) ; Adjust coordinates based on your screen setup
    Sleep(100) ; Wait for menu to open
    TargetX := 205
    TargetY := 632
    UnDesiredColor := "0E72ED"

    ; Get the color at the specified position
    Color := PixelGetColor(TargetX, TargetY, "RGB")

    ; Remove the "0x" prefix from the color for comparison
    Color := SubStr(Color, 3)

    ; Check if the color matches and click if it does
    if !(Color = UnDesiredColor) {
        MouseClick("Left")
    } else {
        Send("{Esc}")
    }
}

