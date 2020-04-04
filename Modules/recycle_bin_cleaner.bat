@echo off
cd Addons
mode 40,20
echo.
echo ---------------------------
echo     Recycle Bin Cleaner    
echo ---------------------------
echo.
choose /c:1 /M "Press 1 to start: "

start recycle.exe /E /F $$ exit /B 0
exit