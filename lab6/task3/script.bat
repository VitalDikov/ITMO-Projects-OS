@echo off

net stop dnscache

net start > nets.txt
timeout /t 120
net start > nets2.txt
fc /A nets.txt nets2.txt > delta.txt

net start dnscache
