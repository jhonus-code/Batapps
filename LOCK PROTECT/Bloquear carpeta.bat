::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGIroL5uT07u6UnlgTWO08c8HS2bvu
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
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9a0q14JUe9/Wo7Y0aGeHMIS/nnmdII+ljdflMIBBRVZbFKoawEgu2F+mkumHIesgSDVb2u92mk8FHRhgmLCzAg6csNtjsJN1ji7nA==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
cls
@ECHO OFF
title Protector de carpetas by MasterCloud
set ESC=
set Red=%ESC%[31m
set Blue=%ESC%[34m
set White=%ESC%[37m
set Green=%ESC%[92m
set Black=%ESC%[0m
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST "OSCAR MUR AIXALA" goto MDLOCKER
:CONFIRM
echo Quiere ocultar la OSCAR MUR AIXALA? (S/N)
set/p "cho="
if %cho%==S goto LOCK
if %cho%==s goto LOCK
if %cho%==n goto END
if %cho%==N goto END
echo Invalid choice.
goto CONFIRM
:LOCK
ren "OSCAR MUR AIXALA" "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Folder locked
goto End
:UNLOCK
echo Introduzca la contrasena para mostrar la CarpetaProtegida%Black%
powershell -Command $password = read-host "Ingrese password: " -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password) ; ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR) > .tmp.txt 
set /p pass=<.tmp.txt & del .tmp.txt
if NOT %pass%== OSCAR-2020 goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" "OSCAR MUR AIXALA"
echo Carpeta desbloqueada correctamente
goto End
AIL
echo contraseña invalida.
goto end
:MDLOCKER
md "OSCAR MUR AIXALA"
echo carpeta OSCAR MUR AIXALA creada correctamente.
goto End
:End