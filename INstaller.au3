#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=1.ico
#AutoIt3Wrapper_Outfile_x64=INstaller.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=*)
#AutoIt3Wrapper_Res_Fileversion=1.2.2.1
#AutoIt3Wrapper_Res_ProductVersion=1.2.1.0
#AutoIt3Wrapper_Res_LegalCopyright=Carmine
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <File.au3>
If Not FileExists('C:\ProgramData\certiport\') Then
	DirCreate('C:\ProgramData\certiport\')
EndIf

$SSlist = _FileListToArrayRec("C:\Users\public\Desktop\", "*console*", $FLTAR_FILES, $FLTAR_NORECUR , $FLTAR_NOSORT, $FLTAR_FULLPATH)

For $i = 1 To UBound($SSlist) - 1
	FileDelete($SSlist[$i])
Next

#cs
If FileExists('C:\Users\Public\Desktop\Console 8.lnk') Then
	FileDelete('C:\Users\Public\Desktop\Console 8.lnk')
EndIf

If FileExists('C:\Users\Public\Desktop\Console_8.lnk') Then
	FileDelete('C:\Users\Public\Desktop\Console_8.lnk')
EndIf
#ce

FileInstall('C8Check.exe', 'C:\ProgramData\certiport\', 1)
FileInstall('Console-8.exe', 'C:\ProgramData\certiport\', 1)
FileInstall('1.ico', 'C:\ProgramData\certiport\', 1)
FileCreateShortcut("C:\ProgramData\certiport\Console-8.exe", "C:\Users\Public\Desktop\Console_8.lnk", "", "", "", 'C:\ProgramData\certiport\1.ico')

$SSlist = _FileListToArrayRec("C:\Users\public\Desktop\", "*console 8*", $FLTAR_FILES, $FLTAR_NORECUR , $FLTAR_NOSORT, $FLTAR_FULLPATH)

For $i = 1 To UBound($SSlist) - 1
	FileDelete($SSlist[$i])
Next

DllCall("shell32.dll", "none", "SHChangeNotify", "long", 0x8000000, "uint", BitOR(0x0, 0x1000), "ptr", 0, "ptr", 0)
