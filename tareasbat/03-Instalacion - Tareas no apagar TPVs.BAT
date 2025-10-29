@ECHO OFF
schtasks /DELETE /TN "NOAPAGAN" /f

timeout 2 /nobreak
::schtasks /CREATE /SC HOURLY /MO 2 /SD 03/01/2002 /TN "BKMYSQL" /TR "C:\bat\BACKMYSQL.exe"
schtasks /CREATE /TN "NOAPAGAN" /TR "C:\Bat\NoApagan.exe" /SC DAILY /ST 03:00:00 /RU System

exit