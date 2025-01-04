#Requires AutoHotkey v2.0

AppsKey::Send("{alt down}{a}{alt up}") ;mic 
RCtrl::Send("{alt down}{y}{alt up}") ;hand
Ralt::LowerHands() 

LowerHands(){
    CoordMode("Mouse", "Window") ; Set coordinate mode relative to active window
    CoordMode("Pixel", "Window") ; Ensure coordinates are relative to the screen

    OpenParticipantWindow()

    Sleep(100)
    MouseClick("Left", 318, 632) ; Click 'More' button
    Sleep(100) ; Wait for menu to open
    Color := PixelGetColor(203, 632, "RGB") ;Get color of the button
    if !(Color == "0x0E72ED") {
        MouseClick("Left") ; if there is a letter then it's 'Lower hands' button
    } else {
        Send("{Esc}") ;if not it's 'Lock the meeting' button
    }
}

OpenParticipantWindow(){
    ParticipantWindow := "Participants"
    if WinExist(ParticipantWindow) {
        WinActivate
    } else {
        Send("{Alt Down}u{Alt Up}") ; Alt+U toggles Participants window
        Sleep(500) ; Wait for window to open
        WinMove(968, 9, 400, 667, ParticipantWindow) ; Adjust position and size
    }
}
