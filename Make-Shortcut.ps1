# Copies the launcher to %USERPROFILE%\FreeClaude and adds a "Free Claude" desktop shortcut.
$d="$env:USERPROFILE\FreeClaude"; New-Item -ItemType Directory -Force $d | Out-Null
Copy-Item "$PSScriptRoot\Start-FreeClaude.ps1" $d -Force
$s=(New-Object -ComObject WScript.Shell).CreateShortcut("$([Environment]::GetFolderPath('Desktop'))\Free Claude.lnk")
$s.TargetPath='powershell.exe'; $s.Arguments="-NoExit -ExecutionPolicy Bypass -File `"$d\Start-FreeClaude.ps1`""; $s.Save()
