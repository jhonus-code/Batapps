::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGFboJ+uv+0/iCskIOaNU2dovUzaevMPBC1nLte5IiwWl7iNtdMDdXeR3mZww7p2EMv2eKVw==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAjk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIbATd4aTbCFUaKNJAvwcfVjw==
::eg0/rx1wNQPfEVWB+kM9LVsJDC+rEEefNPU1xdjJytmujWN9
::fBEirQZwNQPfEVWB+kM9LVsJDC+rEEefNPU1xdjJytmujWN9
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWHSlx3YVGjh4YzGmXA==
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATE2WMDHD5mbyitCU/a
::ZQ0/vhVqMQ3MEVWAtB9wAjN7YmQ=
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9a1p0QTXeE2d8/y16ScJfMa5UuqcI4otg==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title Reiniciador de cola de impresion por si se bloquea en W10
color 4f
net stop spooler
del "%SYSTEMROOT%\System32\spool\PRINTERS\*.*" /q /f
net start spooler
Echo cierra la ventana y prueba de imprimir de nuevo.
Pause