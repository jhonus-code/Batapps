::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGIroL5uT07u6UnlkcVu46bI7IlL2NL4A=
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
::ZQ05rAF9IAHYFVzEqQIcKQ5aTwyHLkboZg==
::eg0/rx1wNQPfEVWB+kM9LVsJDCiDKWW5DrAOxbqb
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWHSF51Y1OjhYQxGGXA==
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wIhNbQmQ=
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9alo1khWOMqdozT36bONOER5kDwdIVtwHNfksofMBdZaxyoZgomhDwMs3yAVw==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title launcher M2
cd\
cd 00RES_M2
MESA1.exe
timeout 10 /nobreak
:bucle
tasklist | find /U handy /I "MESA1.exe"
if %errorlevel%==0 (
echo proceso ejecutandose revisando de nuevo 5 segundos
) else (
echo Cerrando sesion pc, mesa 1 no ejecutandose.
shutdown -l
)
timeout 3 /nobreak
cls
goto bucle
exit