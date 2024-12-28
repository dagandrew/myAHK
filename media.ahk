#Requires AutoHotkey v2.0

<!Esc::Volume_Mute ; Left Alt + Esc 
<!F1::Volume_Down ; Left Alt + F1 
<!F2::Volume_Up   ; Left Alt + F2 
<!F3::MaxVolume() ; Left Alt + F3

<#Esc::Media_Play_Pause ;Left Win + Esc
<#F1::Media_Prev ;Left Win + F1
<#F2::Media_Next ;Left Win + F2

MaxVolume() {
    Send("{Volume_Up}") ; Sends the key to show the volume panel
    SoundSetVolume(100) ; Sets the volume to 100%
}