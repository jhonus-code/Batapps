::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9azrUkSaNMqfc/S1KeaIewS+AX0dIQslnJVi98JABhXQgiIYRw1ui5MuSSKNcuVtA71RVqA51hwC2BmiCPAgzgyYt9tiYMN1iO770T7nqEVwkTMV7oaEG6h461rM9wQwSi1fHXKm6dGCrvrZ7TkCjjJMSkciX7XmYxWvII5YBR6cT1CjoZP7iXuRoCv2WUBYWKMmOXnx1c7dJr6fLQKtRm40T9Swai3kk8PFnMAEFMULw==
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
::ZQ05rAF9IAHYFVzEqQIUJwxaeRSGPX+/FNU=
::eg0/rx1wNQPfEVWB+kM9LVsJDCCNK2WPFrEd/O3pjw==
::fBEirQZwNQPfEVWB+kM9LVsJDCCNK2WPFrEd/O3pjw==
::cRolqwZ3JBvQF1fEqQIULQhXTRaFPSuqB6cf4O3or+6C4kEcR6I+aIPS2bWNKe8d71akZIMolm5ImckNBhpVcQHreAY16WhWpgQ=
::dhA7uBVwLU+EWHSF51Y1OhhYQxGGXA==
::YQ03rBFzNR3SWATE2UMjPB5GTwiNKW/a
::dhAmsQZ3MwfNWATE/ko/Jns=
::ZQ0/vhVqMQ3MEVWAtB9wIhNbQmQ=
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9azrUkSaNMqfc/S1KeaIewS+AX0dIQslnJVi98JABhXQgiIYRw1ui5MuSSKNcuVtA71RVqA51hwC2BmiCPAgzgyYt9tiYMN1iO770T7nqEVwkTMV7oaEG6h461rM9wQwSi1fHX7k6BBT/vvban5MCbHJWAGvnXQn79OkZQjajBxTwxfmfdp+S6Y
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title DownUpdater

cd C:\Bat\SistemaftpSpofiyRest\
IF exist download ( echo *************************** ya existe carpeta Logs *************************** ) ELSE ( MD download )
cls

::testeado funcionando
:VALID
echo Descargando parche en la carpeta C:\Bat\SistemaftpSpofiyRest\download
C:\Bat\SistemaftpSpofiyRest\winscp\winSCP.com /console /script="C:\Bat\SistemaftpSpofiyRest\script2.txt"
goto :SALIDA


:SALIDA
pause
