#Requires AutoHotkey v2.0

MonitorLeftEdge() {
    mx := 0
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx)
    monitor := Floor(mx / A_ScreenWidth)

    return monitor * A_ScreenWidth
}

JumpLeftEdge() {
    x := MonitorLeftEdge() + 2
    y := 0
    CoordMode("Mouse", "Screen")
    MouseGetPos(, &y)
    MouseMove(x, y)
}

JumpBottomEdge() {
    x := 0
    CoordMode("Mouse", "Screen")
    MouseGetPos(&x)
    MouseMove(x, A_ScreenHeight)
}

JumpTopEdge() {
    x := 0
    CoordMode("Mouse", "Screen")
    MouseGetPos(&x)
    MouseMove(x, 0)
}

JumpRightEdge() {
    x := MonitorLeftEdge() + A_ScreenWidth - 2
    y := 0
    CoordMode("Mouse", "Screen")
    MouseGetPos(, &y)
    MouseMove(x, y)
}

ScrollUp() {
    Click("WheelUp")
}

ScrollDown() {
    Click("WheelDown")
}

ScrollUpMore() {
    Loop 4 {
        Click("WheelUp")
    }
}

ScrollDownMore() {
    Loop 4 {
        Click("WheelDown")
    }
}