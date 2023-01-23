; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Sandboxie"
#define MyAppVersion "4.4.0.0"
#define MyAppPublisher "Sandboxie"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{35F4DAAE-D0DE-4E5A-8F0F-9FA2B6537DE6}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
CreateAppDir=no
OutputBaseFilename=Sandboxie
ArchitecturesInstallIn64BitMode=x64
Compression=lzma
SolidCompression=yes
Uninstallable=no
;SetupIconFile=Setup-xp.ico
;WizardImageFile=WizardImage.bmp
;WizardSmallImageFile=WizardSmallImage.bmp

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "Sandboxie.exe"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "Sandboxie.ini"; DestDir: "{win}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Run]
Filename: "{tmp}\Sandboxie.exe"; Parameters: "/S"; StatusMsg: "Installing..."
