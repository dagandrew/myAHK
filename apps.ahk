` & F1::GoProgram("ahk_class CabinetWClass", "C:\Users\" A_UserName "\Drive")
` & F4::GoProgram("ahk_exe Taskmgr.exe", "taskmgr.exe")
` & CapsLock::GoProgram("ahk_exe notepad++.exe", "C:\Program Files\Notepad++\notepad++.exe")
` & LCtrl::GoProgram("ahk_exe msedge.exe", "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")

GoProgram(window, path) {
    ; Check if the specified window is active
    if WinActive(window) {
        ; Minimize the active window
        WinMinimize(window)
    } 
    ; Check if the specified window exists but is not active
    else if WinExist(window) {
        ; Activate the existing window
        WinActivate(window)
    } 
    ; If the window does not exist, run the program
    else {
        Run(path)
    }
}
