::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGIroL5uT07u6UnkQeW+xyeo7Y0aGeM64a6UqE
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSTk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQISCTh/YT2xDUeVNtU=
::eg0/rx1wNQPfEVWB+kM9LVsJDCajH0CXP4YtxMfLjw==
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWHSF51Y1OhhYQxGGXA==
::YQ03rBFzNR3SWATE2UMjPB5GTwiNKW/a
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wKgIURgyNMgs=
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9alo1khdsMcU6Li6YWibc8D71fwYIQsmH9Cnas=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title BACKMYSQLOP
::no tocar variables de tiempo
SET fecha="%date:~0,2%-%date:~3,2%-%date:~6,4%"
set hora="%time:~0,2%h%time:~3,2%m%time:~6,4%s"
::revisar si esta creada la carpeta backups y logs
CD C:\bat
IF exist LOGS ( echo *************************** ya existe carpeta LOGS *************************** ) ELSE ( MD LOGS )
cd C:\
IF exist Backups (echo *************************** ya existe carpeta backup ***************************)  ELSE ( MD Backups)
::revisar si el eco_report.sql esta sin querer en backups
cd C:\Backups\
IF exist C:\Backups\elco_reports.sql (DEL elco_reports.sql /Q)  ELSE ( echo *************************** no existe elco_reports.sql empezamos a crear ***************************)
::revisar si la ubicacion es correcta del mysql
cd C:\Archivos de Programa\MySQL\MySQL Server 5.0\bin
mysqldump --skip-opt --default-character-set=latin1 --extended-insert -u root elco_reports > "C:\Backups\elco_reports.sql"
cd c:\Backups\
zip elco_reports_%fecha%_%hora%.zip C:\Backups\elco_reports.sql
timeout 10 /nobreak
for %%A in (elco_reports.sql) do set size=%%~zA 
::tamaño en bytes comprobacion si elco_report.sql es mas pequeño que ese tamaño grabar log
IF not exist elco_reports.sql (goto :NOEXISTE)
if %size% LSS 104857 (goto :INVALID) else (goto :VALID)
:INVALID 
echo "%fecha% %hora% - El archivo mysql esta corrupto considere en revisar la base de datos" >C:\Bat\LOGS\BACKMYSQL_%fecha%_%hora%.txt
cd c:\Bat\mails\
SwithMail.exe /s /x "c:\Bat\mails\SwithMailSettings.xml "
cd c:\Backups\
DEL elco_reports.sql /Q
exit
:VALID 
echo "%fecha% %hora% - Copia mysql correcta." >C:\Bat\LOGS\BACKMYSQL_%fecha%_%hora%.txt
cd c:\Backups\
DEL elco_reports.sql /Q
exit
:NOEXISTE
echo "%fecha% %hora% - Error no se encontro archivo elco_reports.sql." >C:\Bat\LOGS\BACKMYSQL_%fecha%_%hora%.txt
cd c:\Backups\
DEL elco_reports.sql /Q
exit