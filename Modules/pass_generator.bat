@echo off
color 04
title Password Generator
mode 40,11
cd /
cd UserInfo
Set /a num=%random% %% 9999 + 0001
echo %num%

:Start
cls
echo.
echo ---------------------------
echo Password Generator
echo ---------------------------
echo.
set /p length= How many characters:
echo.
echo.
echo.
choice /c:n /M "Press N to Continue: "


:A
cls
Setlocal EnableDelayedExpansion
set _RNDLength=%length%
set _Alphanumeric=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789
set _Str=%_Alphanumeric%987654321

:_LenLoop
if not "%_Str:~18%"=="" set _Str=%_Str:~9%& set /A _Len+=9& goto :_LenLoop
set _tmp=%_Str:~9,1%
set /A _Len=_Len+_tmp
set _count=0
set _RndAlphaNum=

:_loop
set /a _count+=1
set _RND=%Random%
set /A _RND=_RND%%%_Len%
set _RndAlphaNum=!_RndAlphaNum!!_Alphanumeric:~%_RND%,1!
if !_count! lss %_RNDLength% goto _loop
echo.
echo ---------------------------
echo Password is: !_RndAlphaNum!
echo ---------------------------
echo.
ping 127.0.0.1 > nul
ping 127.0.0.1 > nul
echo If you dont want to save the password 
echo Just close the window
pause
cls
if EXIST Passwords GOTO md2
if NOT EXIST Passwords GOTO md1


:md1
md Passwords
GOTO md2

:md2
cd Passwords
md For-%USERNAME%
GOTO save

:save
cd For-%USERNAME%
set name=Password#%num%
echo Your Password: !_RndAlphaNum! > %name%.txt
cls
echo.
echo ---------------------------
echo Your password was saved
echo ---------------------------
ping 127.0.0.1 > nul
cls
echo.
echo ---------------------------
echo Its called %name%
echo ---------------------------
ping 127.0.0.1 > nul

