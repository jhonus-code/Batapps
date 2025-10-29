::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9azrUkSaNMqfc/S1KeaIewS+AX0dIQslnJVi98JABhXQgiIYRw1ui5MuSSKNcuVtA71RVqA51hwC2BmiCPAgzgyYt9tiYMN1iO770T7nqEVwkTMV7oaEG6h461rM9wQwSi1fHXKm6dGCrvrZ7TkCjjJMSkciX7XmYxWvII5YBR6cT1CjoZP7iXuRoCv2WUBYWKMmOXnx1c7dJr6fLQKtQ6ixDRY2rn9nl4GYg==
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
::cxY6rQJ7JhzQF1fEqQJhZksaHErTXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXrZg==
::ZQ05rAF9IAHYFVzEqQIDPRlRajCyXA==
::eg0/rx1wNQPfEVWB+kM9LVsJDDeXPm6cMoV8
::fBEirQZwNQPfEVWB+kM9LVsJDDeXPm6cMoV8
::cRolqwZ3JBvQF1fEqQIjPRldXkSPJXirCvUa/Pib
::dhA7uBVwLU+EWHSF51Y1OhhYQxGGXA==
::YQ03rBFzNR3SWATE2UMjPB5GTwiNKW/a
::dhAmsQZ3MwfNWATE3ko/Jns=
::ZQ0/vhVqMQ3MEVWAtB9wAhNbQmQ=
::Zg8zqx1/OA3MEVWAtB9wAhNbQmQ=
::dhA7pRFwIByZRRmG7QIaIBRaLA==
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9azrUkSaNMqfc/S1KeaIewS+AX0dIQslnJVi98JABhXQgiIYRw1ui5MuSSKNcuVtA71RVqA51hwC2BmiCPAgzgyYt9tiYMN1iO770T7nqEVwkTMV7oaEG6h461rM9wQwSi1fHX7k6BBT/vvban5MCbHJWAGvnXQn79Zi4EoeRRFXRFUkbB8ry7gRvI=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title pingtestaccion
set cont=0

::testeado funcionando
:BUCLE
ping 10.144.0.89 |find /i "TTL=" >nul || (echo server mysql offline, aborting&goto :INVALID)
goto :REVTAMREST

:REVTAMREST
cd C:\00RES\
for %%a in (REST.MDB) do set File1Date=%%~ta
cd C:\Bat\SistemaftpSpofiyRest\antesbk\
for %%a in (REST.MDB) do set File2Date=%%~ta 
IF "%File1Date%"=="%File2Date%" (goto :REVTAMSPOFI) else (goto :COPYBK)

:REVTAMSPOFI
cd C:\00RES\
for %%a in (SPOFI.MDB) do set File3Date=%%~ta
cd C:\Bat\SistemaftpSpofiyRest\antesbk\ 
for %%a in (SPOFI.MDB) do set File4Date=%%~ta
IF "%File3Date%"=="%File4Date%" (goto :SALIDA) else (goto :COPYBK)

::testeado funcionando
:COPYBK
cd C:\00RES\
copy REST.MDB C:\Bat\SistemaftpSpofiyRest\bk\*.*
copy SPOFI.MDB C:\Bat\SistemaftpSpofiyRest\bk\*.*
goto :VALID

::testeado funcionando
:VALID
echo ping correcto
C:\Bat\SistemaftpSpofiyRest\winscp\winSCP.com /console /script="C:\Bat\SistemaftpSpofiyRest\script.txt"
goto :SALIDA

::testeado funcionando
:INVALID
echo Ping off repetir tarea dentro de 5 minutos.
net stop ZeroTierOneService
taskkill /IM "ZeroTier One.exe" /F
timeout 10 /nobreak
net start ZeroTierOneService
timeout 120 /nobreak
::contador +1
set /a cont+=1
echo Total Repeticiones: %cont%
if %cont% GEQ 5 (goto :MAIL) else (goto :CONTINUE)

::testeado funcionando
:MAIL
cd C:\Bat\mails\
SwithMail.exe /s /x "c:\Bat\mails\subeftp.xml "
goto SALIDA

::testeado funcionando
:CONTINUE
timeout 600 /nobreak
cls
goto BUCLE

:SALIDA
exit
