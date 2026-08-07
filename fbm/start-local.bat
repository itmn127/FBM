@echo off
setlocal
cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 (
  echo Node.js is required to open this site locally.
  echo Install Node.js from https://nodejs.org/ and try again.
  pause
  exit /b 1
)

echo Starting Full Bet Management at http://127.0.0.1:8000/
if not defined FBM_NO_BROWSER start "" /min powershell.exe -NoProfile -WindowStyle Hidden -Command "Start-Sleep -Seconds 1; Start-Process 'http://127.0.0.1:8000/'"
node local-preview-server.mjs

if errorlevel 1 (
  echo.
  echo The local server could not be started.
  pause
)
