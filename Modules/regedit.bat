@echo off
Title REGEDIT
color 04

if "%~s0"=="%~s1" ( cd %~sp1 & shift ) else (
  echo CreateObject^("Shell.Application"^).ShellExecute "%~s0","%~0 %*","","runas",1 >"%tmp%%~n0.vbs" & "%tmp%%~n0.vbs" & del /q "%tmp%%~n0.vbs" & goto :eof
)

GOTO menu

:menu
cls

	echo.
	echo ---------------------------
	echo Registry Editor                  
	echo ---------------------------
	echo By Thomas Reddish
	echo !!ANY CHANGES MADE CAN NOT BE REVERSED!!
	echo. (without professional help)
	echo 1. Disable Apps
	echo 2. Disable app permissions
	echo 3. Other
	echo 4. 
	echo Q. Quit
	echo.
	choice /c:1234q /M "Please choose an action: "
	echo.

	if %errorlevel%==1 call :app
	if %errorlevel%==2 call :perms
	if %errorlevel%==3 call :other
	if %errorlevel%==4 call :
	if %errorlevel%==5 call :
	if %errorlevel%==6 call
	if %errorlevel%==7 call
	if %errorlevel%==8 call
	if %errorlevel%==q call :quit


:app
cls
	echo.
	echo ---------------------------
	echo Registry Editor                  
	echo ---------------------------
	echo By Thomas Reddish
	echo !!ANY CHANGES MADE CAN NOT BE REVERSED!!
	echo. (without professional help)
	echo 1. Windows Defender
	echo 2. Windows Feedback
	echo 3. Windows Store
	echo 4. Windows Tips
	echo 5. Xbox Game Bar
	echo 6. OneDrive
	echo 7. HomeGroup
	echo Q. Quit
	echo.
	choice /c:1234567b /M "Please choose an action: "
	echo.	if %errorlevel%==5 call :

	if %errorlevel%==1 call :def
	if %errorlevel%==2 call :feed
	if %errorlevel%==3 call :store
	if %errorlevel%==4 call :tips
	if %errorlevel%==5 call :xbox
	if %errorlevel%==6 call :one
	if %errorlevel%==7 call :home
	if %errorlevel%==8 call :
	if %errorlevel%==9 call :
	if %errorlevel%==0 call :
	if %errorlevel%==b call :

GOTO menu

:def
cls
echo.
echo This will delete the built in anti-virus
echo.
ping 127.0.0.1 > nul
cls
echo.
echo 1. Yes
echo 2. No
choice /c:12q /M "Are you sure you want to continue: "

if %errorlevel%==1 call :defs
if %errorlevel%==2 call :kill

:kill
pause
exit

:defs
cls
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t "REG_DWORD" /d "1" /f
echo Done!
pause
GOTO app

:feed
cls
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t "REG_DWORD" /d "0" /f
reg delete "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /f
echo Done!
pause
GOTO app

:store
cls
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v "RemoveWindowsStore" /t "REG_DWORD" /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v "DisableStoreApps" /t "REG_DWORD" /d "1" /f
echo Done
pause
GOTO app

:tips
cls
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t "REG_DWORD" /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t "REG_DWORD" /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t "REG_DWORD" /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t "REG_DWORD" /d "1" /f
echo Done!
pause
GOTO app

:xbox
cls
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t "REG_DWORD" /d "0" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t "REG_DWORD" /d "0" /f
echo Done!
pause
GOTO app

:one
cls
taskkill /IM "OneDrive.exe" /F
%windir%\SysWOW64\OneDriveSetup.exe /uninstall
rmdir "%UserProfile%\OneDrive" "%ProgramData%\Microsoft OneDrive" "%LocalAppData%\Microsoft\OneDrive" "C:\OneDriveTemp" /S /Q
reg delete "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
reg delete "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
echo Done!
pause
GOTO app

:home
cls
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HomeGroup" /v "DisableHomeGroup" /t "REG_DWORD" /d "1" /f
echo Done!
pause GOTO app

:perms
cls

	echo.
	echo ---------------------------
	echo Registry Editor                  
	echo ---------------------------
	echo By Thomas Reddish
	echo !!ANY CHANGES MADE CAN NOT BE REVERSED!!
	echo. (without professional help)
	echo 1. Cortana & Web Search bar
	echo 2. Camera Access
	echo 3. Contacts
	echo 4. Radio
	echo 5. Location App
	echo 6. Messaging
	echo 7. Microphone App
	echo 8. Video App
	echo 9. Photo App
	echo Q. Quit
	echo.
	choice /c:1234567b /M "Please choose an action: "
	echo.

	if %errorlevel%==1 call :cor
	if %errorlevel%==2 call :cam
	if %errorlevel%==3 call :con
	if %errorlevel%==4 call :rad
	if %errorlevel%==5 call :loc
	if %errorlevel%==6 call :mess
	if %errorlevel%==7 call :mic
	if %errorlevel%==8 call :vid
	if %errorlevel%==9 call :pho
GOTO menu

:cor
cls
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
echo Done!
pause
GOTO perms

:cam
cls
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
echo Done!
pause
GOTO perms

:con
cls
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessContacts" /t REG_DWORD /d "2" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t "REG_SZ" /d "Deny" /f
echo Done!
pause
GOTO perms

:rad
cls
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessRadios" /t REG_DWORD /d "2" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t "REG_SZ" /d "Deny" /f
echo Done!
pause
GOTO perms

:loc
cls
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessLocation" /t REG_DWORD /d "2" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t "REG_SZ" /d "Deny" /f
echo Done!
pause
GOTO perms

:mess
cls
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessMessaging" /t REG_DWORD /d "2" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t "REG_SZ" /d "Deny" /f
echo Done!
pause
GOTO perms

:mic
cls
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessMicrophone" /t REG_DWORD /d "2" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v "Value" /t "REG_SZ" /d "Deny" /f
echo Done!
pause
GOTO perms

:vid
cls
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t "REG_SZ" /d "Deny" /f
echo Done!
pause
GOTO perms

:pho
cls
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v "Value" /t "REG_SZ" /d "Deny" /f
echo Done!
GOTO perms