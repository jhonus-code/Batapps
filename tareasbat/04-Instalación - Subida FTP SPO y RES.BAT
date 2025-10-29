@ECHO OFF
schtasks /DELETE /TN "FTPSPOFYYREST" /f


::schtasks /CREATE /SC HOURLY /MO 2 /SD 03/01/2002 /TN "BKMYSQL" /TR "C:\bat\BACKMYSQL.exe"
schtasks /CREATE /TN "FTPSPOFYYREST" /TR "C:\Bat\SistemaftpSpofiyRest\SubeFTP.exe" /SC DAILY /ST 17:00:00 /RU System

pause