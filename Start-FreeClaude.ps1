# Starts Claude Code through a local FreeLLMAPI gateway (free-tier models).
# The unified key is read from the user env var FREELLMAPI_KEY; it is never stored in this file.
$exe="$env:LOCALAPPDATA\Programs\freellmapi-desktop\FreeLLMAPI.exe"
if (-not (Get-Process FreeLLMAPI -ErrorAction SilentlyContinue)) { Start-Process $exe; Start-Sleep 8 }
$k=[Environment]::GetEnvironmentVariable('FREELLMAPI_KEY','User')
if (-not $k) { $k=Read-Host "Paste your FreeLLMAPI unified key and press Enter"; [Environment]::SetEnvironmentVariable('FREELLMAPI_KEY',$k,'User') }
$env:ANTHROPIC_BASE_URL='http://127.0.0.1:31415'
$env:ANTHROPIC_AUTH_TOKEN=$k
Set-Location D:\sbs.ans
claude
