# Jack-of-All-Trades
A all in one command-line based (batch) tool to be used by anyone from penetration testers, to that one guy everyone goes to for tech help there should be something for everyone.

## Me
I am not new to batch scripting, but I still have plenty to learn. if you see any errors e-mail me @ ilovehax011@gmail.com -- Thats my coding email, not my personal, so I won't respond immediately but I will fix it as soon as possible

## Use/Setup
This code was designed to be used on a flash drive named "Tool", as such its code allows it to have any drive letter and still work so you can practially use this in any scenrio. Most of the tools do not give any output besides in command line, but tools like the system info grabber, and backup tool do. These make a folder in the root directory of the flashdrive called UserInfo, then make their own folder for their respected output.

My setup for this is making a folder called setup, setting it to a hidden folder, putting everything in there, and make a shortcut to the main menu (this also lets you add a icon)

### Needed tools
All you need is any flashdrive-8gb should be good, but if you plan on using the backup tool often, you may need to give it 16gb+

## Modules Folder
I used a moduals system to make adding new feutures easy and swift. I will try to keep this updated as much as possible

### Main Menu
Cd's into the modules folder and executes the modules based on input from the GUI

### Addons
This is where you place any requred files for the modules

### backup.bat
Backs up the users Document, Pictures, Videos, Desktop, and downloads folder.
(Later I will add a gui and promt the user what to backup)
### cleaner.bat
This tool promts the user to choose between diffrent things to clean

Defrag Tool (after opening it will prompt the user to open in standard or admin)

Clear Cookies

Clean Disk

Clear Internet Temps

Clear Recycle Bin

All of the above
### DosAttack.bat
Starts a Dos Attack

### hangman.bat
Just a game of hangman

### Pass_generator.bat
This script starts by asking how mant characters for the password, then generates a random alphanumaric passowrd with up and lowercase letters. It will then save them to Tool/userInfo/Passwords/ then it will be saved as... (USERNAME#random 4-number string)

### recycle_bin_cleaner.bat
Cd's into addons and opens recycle.exe, this will clear all files in the recycle bin. NOTE This will not prompt the user about any files, so if you open this, any file will be deleted

### resTest.bat 
It just checks the resolution, nothing else. Kinda usless...

### speedtest.bat
This script Cd's into the addons folder, and opens speedtest.exe
This is a app made by the widly-used internet speed test OOKLA that checks the speed in command-line

NOTE: Thanks to reddit user JaJe92 for the idea!

### sysinfo.bat
This script grabs any useful information about a PC that could be used in troubleshooting 

NOTE: If you have better commands/info to get please e-mail me, I had lots of trouble with this one

### timer.bat
Its a timer...

### wifi.bat
Gets all wifi SSID's and passowrds a computer had accessed 

### Legal Stuff
Some of these moduals were not made by me, like the hangman game, timer,and recycle bin tool, but they are under fair personal use. 
