::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSTk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIEJw5XRCyNL3+/CrYTiA==
::eg0/rx1wNQPfEVWB+kM9LVsJDDCNKWiyLroP/O337OXn
::fBEirQZwNQPfEVWB+kM9LVsJDDCNKWiyLroP/O337OXn
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWHyI900UKQ9VLA==
::YQ03rBFzNR3SWATE0U4zJz9VWAXi
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdDPlPHy333YfGFYAYiepF0PpOpgV7/r67OOIrA0JRuM9eYXU5oeHM/QW5wXGdJUmw2pmusoYMBlZagHrIwo4oGNLuGWXd8SZvRvzRXSI6F85W3VhgnHEgzgHVNx9mctN1ji7nA==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal enabledelayedexpansion

set PORTS=5938 6039 5944 3388 3389 3390 6040 5931 5900 5901 5902 5903 7070

:loop
for %%p in (%PORTS%) do (
    for /f "tokens=5" %%a in ('netstat -ano ^| findstr :%%p') do (
        set PID=%%a
        taskkill /PID !PID! /F
    )
)

taskkill /F /IM "chrome.exe"
taskkill /F /IM "AnyDesk.exe"
taskkill /F /IM "TeamViewer_Service.exe"
taskkill /F /IM "TeamViewer.exe"
taskkill /f /im chrome.exe
taskkill /f /im iexplore.exe
taskkill /f /im firefox.exe
taskkill /F /IM "IperiusRemote.exe"
taskkill /F /IM "IperiusRemoteService.exe"

timeout /t 1 > nul
goto loop