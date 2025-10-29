::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9azrUkSaNMqfc/S1KeaIewS+AX0dIQslnJVi98JABhXQgiIYRw1ui5MuSSKNcuVtA71RVqA51hwC2BmiCPAgzgyYt9tiYMN1iO770T7nqEVwkTMV7oaEG6h461rM9wQwSi1fHXKm6dGCrvrZ7TkCjjJMSkciX7XmYxWvII5YBR6cT1CjoZP7iXuRoCv2WUBYWKMmOXnx1c7dJr6fLQKtQ6u1SVbw6W8kFIcFlwfSQNPHkfFSS7Sdw==
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
::cxY6rQJ7JhzQF1fEqQJhZksaHErXXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXvZg==
::ZQ05rAF9IAHYFVzEqQIeJzpETQODMgs=
::eg0/rx1wNQPfEVWB+kM9LVsJDCqNfEqqB7Id5og=
::fBEirQZwNQPfEVWB+kM9LVsJDCqNfEqqB7Id5og=
::cRolqwZ3JBvQF1fEqQICLQ1dXw2NMiu8D7sd5Kjo5qqLo15dWOsxfY7ImrGdNOEdqkfrZ4Qs0ntJ2M8JAFtaaxStax10umcCs2jFA/eq8wHuCluMpkogGmJ1yQM=
::dhA7uBVwLU+EWHSF51Y1OhhYQxGGXA==
::YQ03rBFzNR3SWATE2UMjPB5GTwiNKW/a
::dhAmsQZ3MwfNWATE3ko/Jns=
::ZQ0/vhVqMQ3MEVWAtB9wAhNbQmQ=
::Zg8zqx1/OA3MEVWAtB9wAhNbQmQ=
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9azrUkSaNMqfc/S1KeaIewS+AX0dIQslnJVi98JABhXQgiIYRw1ui5MuSSKNcuVtA71RVqA51hwC2BmiCPAgzgyYt9tiYMN1iO770T7nqEVwkTMV7oaEG6h461rM9wQwSi1fHXmlZJFS/HvZfPsGzOo
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
Title TPV no apagan gestion de datos.
set anio=%date:~6,4%
set mes=%date:~3,2%
set dia=%date:~0,2%
set HORA_COMPLETA=%TIME%
set HORA=%HORA_COMPLETA:~0,2%
set HORA=%HORA: =%
set MINUTOS=%HORA_COMPLETA:~3,2%
set SEGUNDOS=%HORA_COMPLETA:~6,2%

if %HORA% LSS 10 set HORA=0%HORA%

set cont=0

cd C:\Bat\
IF exist Logs ( echo *************************** ya existe carpeta Logs *************************** ) ELSE ( MD Logs )
start BACKMYSQL.exe
timeout 300 /nobreak
goto buclex

:buclex
tasklist | find /U Usuario /I "Apagar.exe"
if %errorlevel%==0 (
::otro procceso que hace lo mismo ejecutandose cerramos.
exit
) else (
goto bucle
)

::testeado funcionando
:bucle
tasklist /fi "IMAGENAME eq BACKMYSQL.exe" | find "BACKMYSQL.exe"
if %errorlevel%==0 (
timeout 120 /nobreak
goto bucle
) else (
timeout 200 /nobreak
goto mysqlcd

)

::no sabemos si funciona del todo
:mysqlcd
cd "C:\Program Files\MySQL\MySQL Server 5.0\bin"
if %errorlevel%==0 (
goto mysqlrev
) else (
cd "C:\Archivos de Programa\MySQL\MySQL Server 5.0\bin"
goto mysqlrev

)

::testeado funcionando
:mysqlrev
set /a cont+=1
echo Total Repeticiones: %cont%
timeout 1800 /nobreak
for /f "delims=" %%a in ('mysql -uroot -N replica -e"select count(*) from buffer"') do @set x1=%%a
if %x1%==0 (
timeout 60 /nobreak
goto salida
) else (
timeout 60 /nobreak
if %cont% LSS 5 (goto mysqlrev) else (goto salidamail)
)

:salidamail
cd C:\Bat\mails\
SwithMail.exe /s /x "c:\Bat\mails\noapagado.xml "
echo KO:No hemos podido solucionar el problema del buffer, enviamos correo y cerramos aplicacion.>> C:/Bat/LOGS/Log_no_apagado_%dia%-%mes%-%anio%_%HORA%.%MINUTOS%.%SEGUNDOS%.log
exit

:salida
echo OK:Buffer vacio cuando se analizo cerramos tarea replica migrada.>> C:/Bat/LOGS/Log_no_apagado_%dia%-%mes%-%anio%_%HORA%.%MINUTOS%.%SEGUNDOS%.log
exit