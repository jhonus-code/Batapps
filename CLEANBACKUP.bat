::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGIroL5uT07u6UnkQQVeU6a8HS2bvu
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
::ZQ05rAF9IAHYFVzEqQITJB5VQgaDP2CvFtU=
::eg0/rx1wNQPfEVWB+kM9LVsJDCeOOWq0BLQf4/3rjw==
::fBEirQZwNQPfEVWB+kM9LVsJDCeOOWq0BLQf4/3rjw==
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWHSF51Y1OhhYQxGGXA==
::YQ03rBFzNR3SWATE2UMjPB5GTwiNKW/a
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wKgIURgyNMgs=
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9alo1khd84aWaH5+5elFdBd713hFQ==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title CLEANBACKUP
cd c:\
::FORFILES /P "C:\Backups" /S /D -7 /c "CMD /c DEL /Q @PATH"
FORFILES /P Backups /D -7 /c "CMD /c DEL /Q @PATH"

::REVISION SI SUPERAN LOS LOGS MAS DE 7 DIAS
cd c:\Bat\
FORFILES /P LOGS /D -7 /c "CMD /c DEL /Q @PATH"

exit