@echo off
echo %computername%


net share temp=C:\%computername%\temp


:here

copier.bat
sleep 60

goto here