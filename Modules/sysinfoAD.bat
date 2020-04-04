@echo off
@setlocal enableextensions
@cd /d "%~dp0"
title Kill Me
if "%~s0"=="%~s1" ( cd %~sp1 & shift ) else (
  echo CreateObject^("Shell.Application"^).ShellExecute "%~s0","%~0 %*","","runas",1 >"%tmp%%~n0.vbs" & "%tmp%%~n0.vbs" & del /q "%tmp%%~n0.vbs" & goto :eof
)
title System Info
cls
cd /
cd UserInfo
md System_Info
cd System_Info
:: NOTE TO SELF, you MUST make the folder in the C: directory, then copy it to drive, THEN delete the folder in C:
:: taskkill /fi "Kill Me" ????
systeminfo >> %USERNAME%.txt
tasklist >> %USERNAME%.txt
net user >> %USERNAME%.txt
gpresult /SCOPE USER /Z >> %USERNAME%.txt
netsh advfirewall firewall show >> %USERNAME%.txt
write %USERNAME%.txt
echo The results are in!
ping 127.0.0.1 > nul
exit