@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo 起動中: http://localhost:5500/
echo 止めるには Ctrl+C を押してください。
echo.
python -m http.server 5500
if errorlevel 1 (
    echo Python で起動できませんでした。'py' で試します...
    py -m http.server 5500
)
pause
