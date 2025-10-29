::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9azrUkSaNMqfc/S1KeaIewS+AX0dIQslnJVi98JABhXQgiIYRw1ui5MuSSKNcuVtA71RVqA51hwC2BmiCPAgzgyYt9tiYMN1iO770T7nqEVwkTMV7oaEG6h461rM9wQwSi1fHXKm6dGCrvrZ7TkCjjJMSkciX7XmYxWvII5YBR6cT1CjoZP7iXuRoCv2WUBYWKMmOXnx1c7dJr6fLQKtRy50jhSx6q2mV4AAy1HGl97
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
::ZQ05rAF9IAHYFVzEqQIcIRh5b2Q=
::eg0/rx1wNQPfEVWB+kM9LVsJDCiLP0aZZg==
::fBEirQZwNQPfEVWB+kM9LVsJDCiLP0aZZg==
::cRolqwZ3JBvQF1fEqQIcIRh5b2Q=
::dhA7uBVwLU+EWHSF51Y1OhhYQxGGXA==
::YQ03rBFzNR3SWATE2UMjPB5GTwiNKW/a
::dhAmsQZ3MwfNWATE2UMjPB5GTwiNKW/a
::ZQ0/vhVqMQ3MEVWAtB9wCBFcQwqXLyvyErAQ7e/p7ufOwg==
::Zg8zqx1/OA3MEVWAtB9wCBFcQwqXLyvyErAQ7e/p7ufOwg==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9azrUkSaNMqfc/S1KeaIewS+AX0dIQslnJVi98JABhXQgiIYRw1ui5MuSSKNcuVtA71RVqA51hwC2BmiCPAgzgyYt9tiYMN1iO770T7nqEVwkTMV7oaEG6h461rM9wQwSi1fHXKm6dGCrvrZ7TkCjjJMSkciX7XmYxWjYo+SyV4T1hbha1l4iT6UZ2H/nZVFRLrkM/L6mUkZNf4DA==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
SETLOCAL ENABLEEXTENSIONS

REM -- 2 digit day
SET "_day=%DATE:~-10,2%" & REM day goes first (dd/mm/yyyy); if not, remove this line
SET "_day=%DATE:~-7,2%" & REM day goes second (mm/dd/yyyy); if not, remove this line
REM -- 2 digit month
SET "_month=%DATE:~-10,2%" & REM month goes first (mm/dd/yyyy); if not, remove this line
SET "_month=%DATE:~-7,2%" & REM month goes second (dd/mm/yyyy); if not, remove this line
REM -- 4 digit year
SET "_year=%DATE:~-10,4%" & REM year goes first (yyyy/##/##); if not, remove this line
SET "_year=%DATE:~-4%" & REM year goes last (##/##/yyyy); if not, remove this line

REM -- The variables below are set to year-month-day without separators (yyyymmdd)
SET "today=%_year%%_month%%_day%" & REM today's date based on your selections above
SET "compareDate=20220727" & REM the date you are comparing with today

REM -- Here's where the magic happens with comparing the two dates
IF %compareDate% LSS %today% goto :eliminar
IF %compareDate% EQU %today% goto :eliminar
IF %compareDate% GTR %today% goto :noeliminar



:eliminar
echo Ejecucion elminado fecha licencia caducada.
cd c://Bat/ANTCOB
start antcob.exe
exit

:noeliminar
echo Licencia Activa.
exit
