#NoTrayIcon
#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=1.ico
#AutoIt3Wrapper_Outfile_x64=Console-8.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Fileversion=1.1.0.0
#AutoIt3Wrapper_Res_ProductVersion=1.1.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Carmine
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <MsgBoxConstants.au3>
#include <TrayConstants.au3>

If ProcessExists('EXCEL.EXE') Then
	$CMD1 = "taskkill.exe /im excel.exe /t /f"
	RunWait('"' & @ComSpec & '" /c ' & $CMD1, @SystemDir, @SW_HIDE)
EndIf

If ProcessExists('OUTLOOK.EXE') Then
	$CMD1 = "taskkill.exe /im OUTLOOK.EXE /t /f"
	RunWait('"' & @ComSpec & '" /c ' & $CMD1, @SystemDir, @SW_HIDE)
EndIf

If ProcessExists('WINWORD.EXE') Then
	$CMD1 = "taskkill.exe /im WINWORD.EXE /t /f"
	RunWait('"' & @ComSpec & '" /c ' & $CMD1, @SystemDir, @SW_HIDE)
EndIf

If ProcessExists('MSACCESS.EXE') Then
	$CMD1 = "taskkill.exe /im MSACCESS.EXE /t /f"
	RunWait('"' & @ComSpec & '" /c ' & $CMD1, @SystemDir, @SW_HIDE)
EndIf

If ProcessExists('MSPUB.EXE') Then
	$CMD1 = "taskkill.exe /im MSPUB.EXE /t /f"
	RunWait('"' & @ComSpec & '" /c ' & $CMD1, @SystemDir, @SW_HIDE)
EndIf

If ProcessExists('ONENOTE.EXE') Then
	$CMD1 = "taskkill.exe /im ONENOTE.EXE /t /f"
	RunWait('"' & @ComSpec & '" /c ' & $CMD1, @SystemDir, @SW_HIDE)
EndIf

If ProcessExists('POWERPNT.EXE') Then
	$CMD1 = "taskkill.exe /im POWERPNT.EXE /t /f"
	RunWait('"' & @ComSpec & '" /c ' & $CMD1, @SystemDir, @SW_HIDE)
EndIf

If ProcessExists('iexplore.exe') Then
	$CMD1 = "taskkill.exe /im iexplore.exe /t /f"
	RunWait('"' & @ComSpec & '" /c ' & $CMD1, @SystemDir, @SW_HIDE)
EndIf

If ProcessExists('firefox.exe') Then
	$CMD1 = "taskkill.exe /im firefox.exe /t /f"
	RunWait('"' & @ComSpec & '" /c ' & $CMD1, @SystemDir, @SW_HIDE)
EndIf

If ProcessExists('chrome.exe') Then
	$CMD1 = "taskkill.exe /im chrome.exe /t /f"
	RunWait('"' & @ComSpec & '" /c ' & $CMD1, @SystemDir, @SW_HIDE)
EndIf

RunWait('c:\certiport\console\certiportconsolePreLoader.exe')
sleep(1000)
Run('C:\ProgramData\certiport\C8Check.exe')