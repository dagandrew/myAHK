#Requires AutoHotkey v2.0

<!Esc::Volume_Mute ; Left Alt + Esc 
<!F1::Volume_Down ; Left Alt + F1 
<!F2::Volume_Up   ; Left Alt + F2 
<!F3::MaxVolume() ; Left Alt + F3

<#Esc::Media_Play_Pause ;Left Win + Esc
<#F1::Media_Prev ;Left Win + F1
<#F2::Media_Next ;Left Win + F2
<#F3::ToggleFxSound()

MaxVolume() {
    Send("{Volume_Up}") ; Sends the key to show the volume panel
    SoundSetVolume(100) ; Sets the volume to 100%
}

;launching FxSound to boost sound
LaunchFxSound(){
    FxSoundPath := "C:\Program Files\FxSound LLC\FxSound\FxSound.exe"

    if FileExist(FxSoundPath) {
        Run(FxSoundPath)
    } else {
        MsgBox "FxSound.exe not found at: " FxSoundPath
    }
    SoundSetVolume(100) ; Sets the volume to 100%
}

;killing FxSound and switching to default speakers
ExitFxSound(){
    defaultSpeakersName := "Динамики"
    Run("taskkill /F /IM FxSound.exe")
    Sleep(1000)
    Run("Lib\nircmd\nircmd.exe setdefaultsounddevice " defaultSpeakersName)
}

ToggleFxSound(){
Run('cmd.exe /c tasklist /FI "IMAGENAME eq FxSound.exe" > tasklist_output.txt', , , )

; Wait for the file to be created
Sleep 500

; Read the file's contents
output := FileRead("tasklist_output.txt")

; Check if FxSound.exe is running
if InStr(output, "FxSound.exe") {
   ExitFxSound()
} else {
    LaunchFxSound()
}

; Clean up by deleting the temporary file
FileDelete("tasklist_output.txt")
}
