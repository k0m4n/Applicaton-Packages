#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Untitled-1.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Fileversion=0.0.0.7
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <MsgBoxConstants.au3>
#include <IE.au3>
SplashTextOn("VBSEdit", "Installing VBSEdit" & @CRLF & "Please Wait...", "250", "65", "-1", "-1", 48, "", "", "")
FileInstall("vbsedit.exe", @TempDir & "\", 1)
ShellExecuteWait("vbsedit.exe", "/SILENT", @TempDir)
SplashOff()
$hmainapp = ShellExecute("vbsedit.exe", "", @ProgramFilesDir & "\vbsedit")
_WinWaitAndActivate("Register Now !", "This is an unregistered version for evaluation use only.")
ControlSend("Register Now !", "This is an unregistered version for evaluation use only.", "[CLASS:Edit; INSTANCE:1]", "{REDACTED}")
ControlClick("Register Now !", "This is an unregistered version for evaluation use only.", "[CLASS:Button; INSTANCE:2]")
_WinWaitAndActivate("License Activation", "Vbsedit is going to start your web browser automatically and connect")
$url = ControlGetText("License Activation", "Vbsedit is going to start your web browser automatically and connect", "[CLASS:Edit; INSTANCE:1]")
ControlClick("License Activation", "Vbsedit is going to start your web browser automatically and connect", "[CLASS:Button; INSTANCE:2]")
;donwload the key
$oIE = _IECreate($url)
_IELinkGetCollection($oIE)
Local $oLinks = _IELinkGetCollection($oIE)
Local $iNumLinks = @extended
;MsgBox(0, "Link Info", $iNumLinks & " links found")
dim $downladurl
For $oLink In $oLinks
	;MsgBox(0, "Link Info", $oLink.href)
	If StringInStr($oLink.href, "Key.exe") Then
		$downladurl = $oLink.href
	EndIf
next
_IEQuit($oIE)
_DownloadProgress($downladurl, "key.exe", "Licence Key")
ShellExecute("key.exe", "", @TempDir)
_WinWaitAndActivate("Vbsedit - Activation", "Please restart Vbsedit.")
ControlClick("Vbsedit - Activation", "Please restart Vbsedit.", "[CLASS:Button; INSTANCE:1]")
ProcessClose($hmainapp)
Func _WinWaitAndActivate($title, $text = "")
	$hWindow = WinWait($title, $text)
	WinActivate($hWindow)
EndFunc
Func _DownloadProgress($FileURL, $FileName, $ProgramName)
    $FileSaveLocation = @TempDir & "\" & $FileName
    $FileSize = InetGetSize($FileURL)
    $FileDownload = InetGet($FileURL, $FileSaveLocation, 0, 1)
    ProgressOn("", "", "", -1, 5, 18)
    Do
        $Percentage = InetGetInfo($FileDownload, 0) * 100 / $FileSize
        ProgressSet($Percentage, Round($Percentage, 0) & "% Downloaded " & Round(InetGetInfo($FileDownload, 0) / 1048576, 2) & " of " & Round($FileSize / 1048576, 2) & " MB", "Downloading " & $ProgramName)
        Sleep(250)
    Until InetGetInfo($FileDownload, 2)
	ProgressOff()
EndFunc   ;==>_DownloadProgress
Func _IsProgramInstalled($sProgramName)
	$wbemFlagReturnImmediately = 0x10
$wbemFlagForwardOnly = 0x20
$colItems = ""
$strComputer = "localhost"

$objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
$colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_Product WHERE Description='"& $sProgramName & "'", "WQL", _
                                          $wbemFlagReturnImmediately + $wbemFlagForwardOnly)

If IsObj($colItems) then
   For $objItem In $colItems
	   if $objItem.Description = $sProgramName Then
		   Return 1
	   Else
		   Return 0
	   EndIf
   Next
Else
   Msgbox(0,"WMI Output","No WMI Objects Found for class: " & "Win32_Product" )
Endif

EndFunc