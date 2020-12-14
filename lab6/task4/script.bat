@echo off
driverquery /FO table /NH > DRIVERS.txt
sort /R DRIVERS.txt /o DRIVERS.txt