#NoTrayIcon
#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Double-J-Design-Ravenna-3d-Users.ico
#AutoIt3Wrapper_Outfile_x64=C8Check.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=*)
#AutoIt3Wrapper_Res_Fileversion=1.2.1.0
#AutoIt3Wrapper_Res_ProductVersion=1.2.1.0
#AutoIt3Wrapper_Res_LegalCopyright=Carmine
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <MsgBoxConstants.au3>
#include <TrayConstants.au3>
Opt("TrayMenuMode", 3) ; The default tray menu items will not be shown and items are not checked when selected. These are options 1 and 2 for TrayMenuMode.
Opt("TrayOnEventMode", 1) ; Enable TrayOnEventMode.
TrayCreateItem("About")
TrayItemSetOnEvent(-1, "About")

TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE, "About") ; Display the About MsgBox when the tray icon is double clicked on with the primary mouse button.
TraySetState($TRAY_ICONSTATE_SHOW) ; Show the tray menu.
Func About()
	; Display a message box about the AutoIt version and installation path of the AutoIt executable.
	MsgBox(32, "msiserver - service checker", "Version 1.2.1.0" & @CRLF & _
			"Checks the state of the service msiserver and adjusts if Console 8 is running", 4) ; Find the folder of a full path.
EndFunc   ;==>About

While 1
	GUIGetMsg()
	If ProcessExists('certiportconsole.exe') Then
		killsvcs()
		Sleep(5000)
	ElseIf Not ProcessExists('certiportconsole.exe') Then
		startsvcs()
		Sleep(5000)
	EndIf
WEnd

Func startsvcs()
	Global $aServicesInfo, $ii, $b
	_ComputerGetServices($aServicesInfo, "All")
	;_ArrayDisplay($aServicesInfo)
	$ax = UBound($aServicesInfo) - 1
	;MsgBox("", "", $a)
	$sSearch = "msiserver"
	For $ii = $ax To 0 Step -1
		If StringRegExp($aServicesInfo[$ii][0], "(?i).*" & $sSearch & ".*") And $aServicesInfo[$ii][17] = 'stopped' Then
			;MsgBox(0, "", $aServicesInfo[$ii][0] & @CRLF & $aServicesInfo[$ii][17], 2)
			RunWait('"' & @ComSpec & '" /c ' & "taskkill.exe /im msiexec.exe /t /f", @SystemDir, @SW_HIDE) ;
			$bb = $aServicesInfo[$ii][0]
			$cmd1 = 'sc start ' & $bb
			RunWait('"' & @ComSpec & '" /c ' & $cmd1, @SystemDir, @SW_HIDE)
			Sleep(1000)
			RunWait('"' & @ComSpec & '" /c ' & "taskkill.exe /im dwm.exe /f", @SystemDir, @SW_HIDE) ;
			Exit
		ElseIf StringRegExp($aServicesInfo[$ii][0], "(?i).*" & $sSearch & ".*") And $aServicesInfo[$ii][17] = 'running' Then
			Exit
		EndIf
	Next
EndFunc   ;==>startsvcs

Func killsvcs()
	Global $aServicesInfo, $ii, $b
	_ComputerGetServices($aServicesInfo, "All")
	;_ArrayDisplay($aServicesInfo)
	$ax = UBound($aServicesInfo) - 1
	;MsgBox("", "", $a)
	$sSearch = "msiserver"
	For $ii = $ax To 0 Step -1
		If StringRegExp($aServicesInfo[$ii][0], "(?i).*" & $sSearch & ".*") And $aServicesInfo[$ii][17] = 'running' Then
			RunWait('"' & @ComSpec & '" /c ' & "taskkill.exe /im msiexec.exe /t /f", @SystemDir, @SW_HIDE) ;
			$bb = $aServicesInfo[$ii][0]
			$cmd1 = 'sc stop ' & $bb
			RunWait('"' & @ComSpec & '" /c ' & $cmd1, @SystemDir, @SW_HIDE)
			;MsgBox(0, "", $aServicesInfo[$ii][0] & @CRLF & $aServicesInfo[$ii][17])
		EndIf
	Next
	If ProcessExists('msiexec.exe') Then
		RunWait('"' & @ComSpec & '" /c ' & "taskkill.exe /im msiexec.exe /t /f", @SystemDir, @SW_HIDE) ;
	EndIf

EndFunc   ;==>killsvcs


Func _ComputerGetServices(ByRef $aServicesInfo, $sState = "All")
	Local $cI_Compname = @ComputerName, $wbemFlagReturnImmediately = 0x10, $wbemFlagForwardOnly = 0x20
	Local $colItems, $objWMIService, $objItem
	Dim $aServicesInfo[1][23], $i = 1

	$objWMIService = ObjGet("winmgmts:\\" & $cI_Compname & "\root\CIMV2")
	$colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_Service", "WQL", $wbemFlagReturnImmediately + $wbemFlagForwardOnly)

	If IsObj($colItems) Then
		For $objItem In $colItems
			If $sState <> "All" Then
				If $sState = "Stopped" And $objItem.State <> "Stopped" Then ContinueLoop
				If $sState = "Running" And $objItem.State <> "Running" Then ContinueLoop
			EndIf
			ReDim $aServicesInfo[UBound($aServicesInfo) + 1][23]
			$aServicesInfo[$i][0] = $objItem.Name
			$aServicesInfo[$i][1] = $objItem.AcceptPause
			$aServicesInfo[$i][2] = $objItem.AcceptStop
			$aServicesInfo[$i][3] = $objItem.CheckPoint
			$aServicesInfo[$i][4] = $objItem.Description
			$aServicesInfo[$i][5] = $objItem.CreationClassName
			$aServicesInfo[$i][6] = $objItem.DesktopInteract
			$aServicesInfo[$i][7] = $objItem.DisplayName
			$aServicesInfo[$i][8] = $objItem.ErrorControl
			$aServicesInfo[$i][9] = $objItem.ExitCode
			$aServicesInfo[$i][10] = $objItem.PathName
			$aServicesInfo[$i][11] = $objItem.ProcessId
			$aServicesInfo[$i][12] = $objItem.ServiceSpecificExitCode
			$aServicesInfo[$i][13] = $objItem.ServiceType
			$aServicesInfo[$i][14] = $objItem.Started
			$aServicesInfo[$i][15] = $objItem.StartMode
			$aServicesInfo[$i][16] = $objItem.StartName
			$aServicesInfo[$i][17] = $objItem.State
			$aServicesInfo[$i][18] = $objItem.Status
			$aServicesInfo[$i][19] = $objItem.SystemCreationClassName
			$aServicesInfo[$i][20] = $objItem.SystemName
			$aServicesInfo[$i][21] = $objItem.TagId
			$aServicesInfo[$i][22] = $objItem.WaitHint
			$i += 1
		Next
		$aServicesInfo[0][0] = UBound($aServicesInfo) - 1
		If $aServicesInfo[0][0] < 1 Then
			SetError(1, 1, 0)
		EndIf
	Else
		SetError(1, 2, 0)
	EndIf
EndFunc   ;==>_ComputerGetServices



