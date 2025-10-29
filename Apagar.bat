::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9azrUkSaNMqfc/S1KeaIewS+AX0dIQslnJVi98JABhXQgiIYRw1ui5MuSSKNcuVtA71RVqA51hwC2BmiCPAgzgyYt9tiYMN1iO770T7nqEVwkTMV7oaEG6h461rM9wQwSi1fHXKm6dGCrvrZ7TkCjjJMSkciX7XmYxWvII5YBR6cT1CjoZP7iXuRoCv2WUBYWKMmOXnx1c7dJr6fLQKtRynxzZf3Lmw2VQKDQM=
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
::cxY6rQJ7JhzQF1fEqQJhZksaHErXXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXvZg==
::ZQ05rAF9IAHYFVzEqQIROBpTTQCNfGqvEroR6fzy7OXn
::eg0/rx1wNQPfEVWB+kM9LVsJDCWSPWy7Arpc6f3v4OeGtkQeW4I=
::fBEirQZwNQPfEVWB+kM9LVsJDCWSPWy7Arpc6f3v4OeGtkQeW4I=
::cRolqwZ3JBvQF1fEqQIROBpTTQCNfGqvEroR6fzy7OXHpkgRVft/Kd/W07qbNO8Aig==
::dhA7uBVwLU+EWHSF51Y1OhhYQxGGXA==
::YQ03rBFzNR3SWATE2UMjPB5GTwiNKW/a
::dhAmsQZ3MwfNWATE3ko/Jns=
::ZQ0/vhVqMQ3MEVWAtB9wAhNbQmQ=
::Zg8zqx1/OA3MEVWAtB9wAhNbQmQ=
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9azrUkSaNMqfc/S1KeaIewS+AX0dIQslnJVi98JABhXQgiIYRw1ui5MuSSKNcuVtA71RVqA51hwC2BmiCPAgzgyYt9tiYMN1iO770T7nqEVwkTMV7oaEG6h461rM9wQwSi1fHXpirJSS+SgbqXsYw==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
Title Apagado automatico
MODE 100,25
set ESC=
set Red=%ESC%[31m
set Blue=%ESC%[34m
set White=%ESC%[37m
set Green=%ESC%[92m
set anio=%date:~6,4%
set mes=%date:~3,2%
set dia=%date:~0,2%
set HORA_COMPLETA=%TIME%
set HORA=%HORA_COMPLETA:~0,2%
set HORA=%HORA: =%
set MINUTOS=%HORA_COMPLETA:~3,2%
set SEGUNDOS=%HORA_COMPLETA:~6,2%

if %HORA% LSS 10 set HORA=0%HORA%

::contadores
set cont=0

cd C:\Bat\
IF exist Logs ( echo *************************** ya existe carpeta Logs *************************** ) ELSE ( MD Logs )
cls
echo ---------------------------------------------------------------------------------
echo El TPV se apagara cuando acabe la cuenta atras, se esta sincronizando con central. 
echo No cierre ventana o no se apagara.
echo ---------------------------------------------------------------------------------
start BACKMYSQL.exe
timeout 300 /nobreak
cls
goto bucle

::testeado funcionando
:bucle
tasklist /fi "IMAGENAME eq BACKMYSQL.exe" | find "BACKMYSQL.exe"
if %errorlevel%==0 (
cls
echo ---------------------------------------------------------------------------------
echo El TPV se apagara cuando acabe la cuenta atras, se esta sincronizando con central. 
echo No cierre ventana o no se apagara.
echo ---------------------------------------------------------------------------------
echo %Red%Proceso de BACKMYSQL ejecutandose se revisara de nuevo en 120 segundos%White%
timeout 120 /nobreak
goto bucle
) else (
cls
echo ---------------------------------------------------------------------------------
echo El TPV se apagara cuando acabe la cuenta atras, se esta sincronizando con central. 
echo No cierre ventana o no se apagara.
echo ---------------------------------------------------------------------------------
echo %Green%Se acabo de hacer la copia de seguridad
echo Comprimiendo espere...%White%
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
for /f "delims=" %%a in ('mysql -uroot -N replica -e"select count(*) from    buffer"') do @set x1=%%a
if %x1%==0 (
cls
echo ---------------------------------------------------------------------------------
echo El TPV se apagara cuando acabe la cuenta atras, se esta sincronizando con central. 
echo No cierre ventana o no se apagara.
echo ---------------------------------------------------------------------------------
echo %Green%Proceso de cerrado final activado tiempo de espera 60 seg%White%
timeout 60 /nobreak
goto salida
) else (
cls
echo %White%---------------------------------------------------------------------------------
echo El TPV se apagara cuando acabe la cuenta atras, se esta sincronizando con central. 
echo No cierre ventana o no se apagara.
echo ---------------------------------------------------------------------------------
echo %Red%Se detectaron %x1% Lineas en el Buffer de la replica. Posponemos espera...%White%
timeout 60 /nobreak
if %cont% LSS 5 (goto mysqlrev) else (goto salidamail)
)

:salidamail
echo KO:No hemos podido solucionar el problema del buffer, enviamos correo y cerramos aplicacion.>> C:/Bat/Logs/Log_no_apagado_%dia%-%mes%-%anio%_%HORA%.%MINUTOS%.%SEGUNDOS%.log
cd C:\Bat\mails\
SwithMail.exe /s /x "c:\Bat\mails\apagado.xml "
cls
echo ---------------------------------------------------------------------------------
echo El TPV se apagara cuando acabe la cuenta atras, se esta sincronizando con central. 
echo No cierre ventana o no se apagara.
echo ---------------------------------------------------------------------------------
echo %Red%No hemos podio realizar el apagado ya que el sistema no consigue enviar las ultimas lineas enviado correo a Mastercloud.
echo Esperando a tecnico...%White%
pause

:salida
cls
echo ---------------------------------------------------------------------------------
echo El TPV se apagara cuando acabe la cuenta atras, se esta sincronizando con central. 
echo No cierre ventana o no se apagara.
echo ---------------------------------------------------------------------------------
echo %Green%Apagando ordenador en 10 segundos, no toque nada.%White%
shutdown -s -t 10
exit