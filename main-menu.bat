@echo off
cd Modules
color 04
mode 45,20
title All-In-On USB
GOTO :menu-1

:Show-menu
cls

	echo.
	echo ---------------------------
	echo USB Hack Key              
	echo ---------------------------
	echo By Thomas Reddish
	echo.
	echo 1. Grab WiFi Passwords
	echo 2. Start DOS Attack
	echo 4. 
	echo 4. 
	echo B. Back
	echo.
	choice /c:1234b /M "Please choose an action: "
	echo.

	if %errorlevel%==1 call :wifi
	if %errorlevel%==2 call :dos
	if %errorlevel%==3 call 
	if %errorlevel%==4 call 
	if %errorlevel%==5 call
	if %errorlevel%==6 call
	if %errorlevel%==7 call
	if %errorlevel%==8 call
	if %errorlevel%==b call :back

GOTO menu-1

:: Display all the processes that match a criteria
:powershell
	powershell


:: WiFi Grabber
:wifi
	start wifi.bat

GOTO Show-menu


:dos
	start DosAttack.bat
GOTO Show-menu

:tools
cls

	echo.
	echo ---------------------------
	echo USB Tools                 
	echo ---------------------------
	echo By Thomas Reddish
	echo.
	echo 1. PC Cleaner
	echo 2. Back Up to USB
	echo 3. Passowrd Generator
	echo 4. (ADMIN) System Info
	echo 5. Check Internet Speed
	echo 0. 
	echo B. 
	echo.
	choice /c:12345b /M "Please choose an action: "
	echo.

	if %errorlevel%==1 call :clean
	if %errorlevel%==2 call :files
	if %errorlevel%==3 call :pass
	if %errorlevel%==4 call :sys
	if %errorlevel%==5 call :spd
	if %errorlevel%==6 call
	if %errorlevel%==7 call
	if %errorlevel%==8 call
	if %errorlevel%==b call :back

GOTO menu-1


:clean
start cleaner.bat
exit

:files
start backup.bat
GOTO tools

:pass
	start pass_generator.bat
GOTO tools

:sys
cd System_Info
start sysinfoAD.bat
GOTO tools

:spd
start speedtest.bat
GOTO tools
:other
cls

	echo.
	echo ---------------------------
	echo Other                     
	echo ---------------------------
	echo By Thomas Reddish
	echo. 
	echo 1. Play Hangman
	echo 2. Check the resolution
	echo 3. Timer
	echo 4. 
	echo B. 
	echo.
	choice /c:1234b /M "Please choose an action: "
	echo.

	if %errorlevel%==1 call :hangman
	if %errorlevel%==2 call :res
	if %errorlevel%==3 call :timer
	if %errorlevel%==4 call 
	if %errorlevel%==5 call
	if %errorlevel%==6 call
	if %errorlevel%==7 call
	if %errorlevel%==8 call
	if %errorlevel%==b call :back

GOTO menu-1


:hangman
	start hangman.bat
	GOTO other

:Res
start ResTest.bat
GOTO other

:timer
start timer.bat
GOTO other

:menu-1
cls
	echo.
	echo ---------------------------
	echo USB Jack of All Trades    
	echo ---------------------------
	echo By Thomas Reddish
	echo.
	echo 1. PenTesting
	echo 2. Personal
	echo 3. Other
	echo 4. Open Command prompt
	echo 5. Open Powershell
	echo Q. Quit
	echo.
	choice /c:12345q /M "Please choose an action: "
	echo.
	
	if %errorlevel%==1 call :Show-menu
	if %errorlevel%==2 call :tools
	if %errorlevel%==3 call :other
	if %errorlevel%==4 call :cmd
	if %errorlevel%==5 call :ps
	if %errorlevel%==Q call :Quit

:cmd 
cls
cmd

:ps
cls
powershell

goto quit


:back
GOTO Menu-1

:Quit
