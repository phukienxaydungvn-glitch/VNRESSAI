; Inno Setup script for Trend Radar AI
[Setup]
AppId={{B3EA2F7C-5E95-4D9D-B57C-AFA993DC7611}
AppName=Trend Radar AI
AppVersion=0.1.0
DefaultDirName={autopf}\Trend Radar AI
DefaultGroupName=Trend Radar AI
OutputDir=dist
OutputBaseFilename=TrendRadarAI-Setup
Compression=lzma
SolidCompression=yes

[Files]
Source: "..\..\apps\desktop\src-tauri\target\release\bundle\msi\*"; DestDir: "{app}"; Flags: recursesubdirs

[Run]
Filename: "{app}\Trend Radar AI.exe"; Description: "Launch Trend Radar AI"; Flags: nowait postinstall skipifsilent
