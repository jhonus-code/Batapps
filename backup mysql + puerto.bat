::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGIroL5uT07u6UnkQeW+xyeo7Y0aGeM64a6UqE
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
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
::ZQ05rAF9IAHYFVzEqQISAzZtfzWud1uPI4cox4g=
::eg0/rx1wNQPfEVWB+kM9LVsJDCapEVKJN5lX2N3e3d6owg==
::fBEirQZwNQPfEVWB+kM9LVsJDCapEVKJN5lX2N3e3d6owg==
::cRolqwZ3JBvQF1fEqQIdKQhASRaBMGSvAtU=
::dhA7uBVwLU+EWHSF51Y1OhhYQxGGXA==
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wKgIUZgyNMgs=
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9alo1khWfssaYPn+J+jGdMixg7UQLMf4lUUndMJbA==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
﻿@echo off
F:
set/p puerto= Pon el puerto centro a hacer backup:
::no tocar variables de tiempo
SET fecha="%date:~0,2%-%date:~3,2%-%date:~6,4%"
set hora="%time:~0,2%h%time:~3,2%m"
::set hora="%time:~0,2%h%time:~3,2%m%time:~6,4%s" con segundos
::revisar si esta creada la carpeta backups
CD F:\Bat
IF exist LOGS ( echo *************************** ya existe carpeta LOGS *************************** ) ELSE ( MD LOGS )
cd F:\
IF exist Backups (echo *************************** ya existe carpeta backup ***************************)  ELSE ( MD Backups)
cd F:\Backups\
IF exist F:\Backups\elco_reports.sql (DEL elco_reports.sql /Q)  ELSE ( echo *************************** no existe elco_reports.sql empezamos a crear ***************************)
::revisar si la ubicacion es correcta del mysql
cd F:\bbdd\mysql\mysql%puerto%\bin
mysqldump --port=%puerto% --skip-opt --default-character-set=latin1 --extended-insert -u root elco_reports > F:\Backups\elco_reports.sql
cd F:\Backups\
zip elco_reports_%puerto%_%fecha%_%hora%.zip F:\Backups\elco_reports.sql
timeout 10 /nobreak
for %%A in (elco_reports.sql) do set size=%%~zA 
::tamaño en bytes comprobacion si elco_report.sql es mas pequeño que ese tamaño grabar log
IF not exist elco_reports.sql (goto :NOEXISTE)
if %size% LSS 10485760 (goto :INVALID) else (goto :VALID)
:INVALID 
echo "%fecha% %hora% - El archivo mysql esta corrupto considere en revisar la base de datos" >F:\Bat\LOGS\BACKMYSQL_%fecha%_%hora%.txt
DEL elco_reports.sql /Q
exit
:VALID 
echo "%fecha% %hora% - Copia mysql correcta." >F:\Bat\LOGS\BACKMYSQL_%fecha%_%hora%.txt
DEL elco_reports.sql /Q
start %windir%\explorer.exe "F:\Backups\"
exit
:NOEXISTE
echo "%fecha% %hora% - Error no se encontro archivo elco_reports.sql." >F:\Bat\LOGS\BACKMYSQL_%fecha%_%hora%.txt
DEL elco_reports.sql /Q
exit