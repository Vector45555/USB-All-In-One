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
SET timestamp=[%date%, %time%]
md %USERNAME%
cd %USERNAME%
cls
echo The mail you send it to must have less secure app access enabled
set /p mail="What is the e-mail you want to send to? > "
cls
echo Password?
echo.
set "psCommand=powershell -Command "$pword = read-host 'Enter Password' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p


cls

echo $SMTPServer = 'smtp.gmail.com' >> email.ps1
echo  $SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587) >> email.ps1
echo  $SMTPInfo.EnableSsl = $true >> email.ps1
echo  $SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('%mail%', '%password%') >> email.ps1
echo  $ReportEmail = New-Object System.Net.Mail.MailMessage >> email.ps1
echo  $ReportEmail.From = '%mail%' >> email.ps1
echo  $ReportEmail.To.Add('%mail%') >> email.ps1
echo  $ReportEmail.Subject = 'PC Report of ' + $env:UserName >> email.ps1
echo  $ReportEmail.Body = 'Here they are' >> email.ps1
echo  $ReportEmail.Attachments.Add('System.txt') >> email.ps1
echo  $ReportEmail.Attachments.Add('Tasks.txt') >> email.ps1
echo  $ReportEmail.Attachments.Add('User.txt') >> email.ps1
echo  $ReportEmail.Attachments.Add('GP.txt') >> email.ps1
echo  $ReportEmail.Attachments.Add('Firewall.txt') >> email.ps1
echo  $SMTPInfo.Send($ReportEmail)  >> email.ps1
echo  Remove-Item -Path $MyInvocation.MyCommand.Source >> email.ps1

echo %timestamp% >> System.txt
systeminfo >> System.txt

echo %timestamp% >> Tasks.txt
tasklist >> Tasks.txt

echo %timestamp% >> User.txt
net user >> User.txt

echo %timestamp% >> GP.txt
gpresult /SCOPE USER /Z >> GP.txt

echo %timestamp% >> Firewall.txt
netsh advfirewall firewall show >> Firewall.txt

powershell -windowstyle hidden -ExecutionPolicy ByPass -File email.ps1
echo The results are in!
ping 127.0.0.1 > nul
exit