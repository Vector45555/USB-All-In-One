@echo off
CLS
if "%~s0"=="%~s1" ( cd %~sp1 & shift ) else (
  echo CreateObject^("Shell.Application"^).ShellExecute "%~s0","%~0 %*","","runas",1 >"%tmp%%~n0.vbs" & "%tmp%%~n0.vbs" & del /q "%tmp%%~n0.vbs" & goto :eof
)
C:
CD \
ECHO WARNING: Cleaning files
ECHO Removing all temp files
Del *.tmp /s /q
Del *.tmp /s /q

ECHO Removing log files
Del *.log /s /q

CLS

REM Defragmenting C: drive
defrag c: /h /x 

REM Checking integrity of system files
SFC /SCANNOW
CLS
GOTO menu
