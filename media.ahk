#Requires AutoHotkey v2.0

<!Esc::Volume_Mute ; Left Alt + Esc 
<!F1::Volume_Down ; Left Alt + F1 
<!F2::Volume_Up   ; Left Alt + F2 
<!F3::MaxVolume() ; Left Alt + F3
<!F4::ToggleFxSound() ;Left Alt + F4

<#Esc::Media_Play_Pause ;Left Win + Esc
<#F1::Media_Prev ;Left Win + F1
<#F2::Media_Next ;Left Win + F2
Capslock & 1::SwitchWifi("RT-GPON-77D8")
Capslock & 2::SwitchWifi("RT-5GPON-77D8")
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
    RunWait(Format('cmd.exe /c tasklist /FI "IMAGENAME eq FxSound.exe" > "{}"', A_Temp "\output.txt"), "", "Hide")

    ; Read the file's contents
    output := FileRead(A_Temp "\output.txt")

    ; Check if FxSound.exe is running
    if InStr(output, "FxSound.exe") {
       ExitFxSound()
    } else {
        LaunchFxSound()
    }

    ; Clean up by deleting the temporary file
    FileDelete(A_Temp "\output.txt")
}


SwitchWifi(wifi) {
    ; Run the command to get current Wi-Fi interface details and save output to a temporary file
    RunWait(Format('cmd /c netsh wlan show interfaces > "{}"', A_Temp "\output.txt"), "", "Hide")

    ; Read the content of the output file
    output := FileRead(A_Temp "\output.txt")

    ; Check if already connected to the desired Wi-Fi network
    if !InStr(output, wifi) {
        ; If not connected, attempt to connect to the specified network
        RunWait(Format('cmd /c netsh wlan connect name="{}"', wifi), "", "Hide")
    } else {
        MsgBox("Already connected to " wifi ".")
    }

    ; Clean up: Delete temporary file
    FileDelete(A_Temp "\output.txt")
}
