::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGIroL5uT07u6UnkscQus8d4GV07eBQA==
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
::ZQ05rAF9IAHYFVzEqQIAIRVTWAGRKG6oZg==
::eg0/rx1wNQPfEVWB+kM9LVsJDDSLMmyuA6YI7fqb
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWHSF51Y1OhhYQxGGXA==
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wCBFcQwri
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9alo1khZOsxf5veyaDAJfgWig==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
Title Ping Master @jhon
set ESC=
set Red=%ESC%[31m
set Blue=%ESC%[34m
set White=%ESC%[37m
set Green=%ESC%[92m

 
REM Si queremos retrasar el incio del test habilitamos la linea del timeout
REM timeout 240 > NUL
set/p ipsnif= Pon la ip que se le va hacer el ping:
echo.
echo %Green%El test de conexion a %ipsnif% cada 4 segundos ha comenzado, revisa el log que se genera en la misma ubicacion.
echo.
 
 
REM Creamos el archivo cada vez que se ejecuta el programa con la fecha y hora en el nombre y la primera linea
 
REM Al poner muchas variables seguidas asignadas a otra variable parece que daba fallo
REM set Any=%Date:~-4%
REM set Mes=%Date:~3,2%
REM set Dia=%Date:~0,2%
 
REM set Hor=%Time:~0,2%
REM set Min=%Time:~3,2%
REM set Seg=%Time:~6,2%
REM set nombre=%Any%-%Mes%-%Dia%__%Hor%-%Min%-%Seg%
 
REM Preparamos el nombre del archivo con solo 3 variables para que no de fallo
SET fecha="%date:~0,2%-%date:~3,2%-%date:~6,4%"
set Separador=__
set hora="%time:~0,2%h%time:~3,2%m"



 
set nombre=%fecha%%Separador%%hora%
echo %nombre% > %nombre%.txt
 
REM Hacemos ping y lo anadimos poniendo la fecha delante linea a linea
:LOOPSTART 
 
    (
      FOR /L %%i in (1,1,1) do (
        <nul (set /p tm=%date% %time:~,-3% )
        PING -n 1 %ipsnif% | FIND "TTL"
        IF ERRORLEVEL 1 ECHO Error, Tiempo de espera agotado. No se ha podido conectar con la IP. 
      )
    ) >> %nombre%.txt
 
REM tiempo que queremos que pase entre ping y ping en segundos
timeout 4 > NUL
 
GOTO LOOPSTART
 
pause