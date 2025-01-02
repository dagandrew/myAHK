#Requires AutoHotkey v2.0

MediaWindowName := "Media Player Window"
ZoomShareWindowName := "Select a window or an application that you want to share"
ZoomWindowName := "Zoom Meeting"

PgUp::PreviousMediaItem()
PgDn::NextMediaItem()
Capslock & s::ShareZoomSound()
Capslock & d::DepartZoomShare()
CapsLock & a:: {
    if WinExist(ZoomShareWindowName) {
        JumpRightEdge()
        WinActivate(ZoomShareWindowName)
        Send("{Enter}")
        NextShortcut()
    } else {
		ShareM3()
    }
}

Capslock & q::^!+t ;pause sharing
;Capslock & w::
;Capslock & e::LaunchM3()
CapsLock & r::ToggleMeetingControls()

PreviousMediaItem(){
	PreviousShortcut()
	sleep(500)
	StopShortcut()
}

NextMediaItem(){
	NextShortcut()
	sleep(500)
	StopShortcut()
}

NextShortcut(){
	Send("{Alt down}{0}{Alt up}")
}

PreviousShortcut(){
	Send("{Alt down}{9}{Alt up}")
}

StopShortcut(){
	Sleep(100)
	Send("{Alt down}{7}{Alt up}")
	Sleep(500)
	Send("{Alt down}{7}{Alt up}")
}


ChooseSharingWindow() {
    Sleep(2000)
	Loop 3 {
		Send("{Tab}")
		Sleep(50) ; Add a slight delay between each Tab press for reliability
	}
    Sleep(100)
    Send("{Down}")
}

ToggleMeetingControls() {
    Send("^!+h")
}

ShareM3() {
    If WinExist(MediaWindowName) {
		WinActivate(MediaWindowName)
		Sleep(1000)
		ShareScreen()
        if WinExist(ZoomWindowName) { ; prepare
            ChooseSharingWindow()
            WinMove(A_ScreenWidth - 100, 0, , , ZoomShareWindowName)
        } else { ; stop and prepare
            StopShortcut()
            ShareM3()
        }
    }
}


ShareZoomSound() {
    WinActivate(ZoomWindowName)
    ShareScreen()
    WinWait(ZoomShareWindowName, , 3)
    Sleep(2000)
    Send("{Tab}")
    Sleep(200)
    Send("{Right 2}")
    Sleep(200)
    Send("{Space}")
    Sleep(200)
    Send("{Tab}")
    Sleep(200)
    Send("{Down 2}")
    Sleep(200)
}

DepartZoomShare() {
    WinActivate(MediaWindowName)
    WinActivate(ZoomWindowName)
    ShareScreen() ; to stop playing music
    Sleep(1000)

    if !WinActive(ZoomShareWindowName) {
        ShareScreen() ; to launch again
        Sleep(1000)
    }

    if WinActive(ZoomShareWindowName) {
        Sleep(1000)
        CoordMode("Mouse", "Window")
        MouseClick("Left", 270, 45)
        Sleep(1000)
        MouseClick("Left", 145, 400)
        Sleep(1000)
        MouseClick("Left", 818, 340)
        Sleep(1000)
        MouseClick("Left", 145, 400)
    }
}

ShareScreen() {
    Send("{Alt Down}{s}{Alt Up}")
}
