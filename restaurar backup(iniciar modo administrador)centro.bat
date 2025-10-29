::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGIroL5uT07u6UnkYUR/EvdoiW17WHLvQW5ETqdpNg1XVXiN4YCQkVdxGkYBx5qHtWuWmKNc6QtkLzT1iI71l9CG17ly7ZjyQ1LcFtidcMwSXz7ET8i7AC1GuyC6gMRWDkka84aJoGrFj6Oh+fyuUFE6W/Pu+4VmWedjtL3CCSxYppkeM=
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
::ZQ05rAF9IAHYFVzEqQICLQhATRGQPXn6C6wP+eS77euEqVgNNA==
::eg0/rx1wNQPfEVWB+kM9LVsJDDaHL3+7E6cd+qj29vmWrg0fVeE0bZ+7
::fBEirQZwNQPfEVWB+kM9LVsJDDaHL3/6K6wP+eS7zcHn
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWHSF51Y1OhhYQxGGXA==
::YQ03rBFzNR3SWATE2UMjPB5GTwiNKW/a
::dhAmsQZ3MwfNWATE2k1Q
::ZQ0/vhVqMQ3MEVWAtB9wCBlNRgyNMgs=
::Zg8zqx1/OA3MEVWAtB9wCBlNRgyNMgs=
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9alo1khWfssaYPn6JG9FMEm2GTWWK8e51YXu84CGAlXMBeza28=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title RESTAURARMYSQL Centro
::parar servicio mysql5
net stop MySQL5
timeout 10 /nobreak
cd C:\Archivos de Programa\MySQL\MySQL Server 5.0\data
::renombrar carpeta antigua a old
echo *************************** renombrando carpeta actual elco_repots a elco_reports_old ***************************
IF exist elco_reports_old (rd elco_reports_old /S /Q)  ELSE ( echo *************************** no existe carpeta elco_reports_old ***************************)
IF exist elco_reports (rename elco_reports elco_reports_old) ELSE ( echo *************************** no existe carpeta elco_reports ***************************)
::crear carpeta elco_reports de nuevo
echo *************************** creando carpeta vacia elco_reports ***************************
MD elco_reports
::eliminar logs mysql5
echo *************************** eliminando archivos cache mysql ib_logfile0, ib_logfile1, ibdata1.  ***************************
DEL ib_logfile0 /Q
DEL ib_logfile1 /Q
DEL ibdata1 /Q
::iniciar servicio mysql5
net start MySQL5
echo *************************** Espera inicial para lanzar la restaurancion por mysql5 ***************************
timeout 10 /nobreak
::iniciar volcado de nuevo de la nueva base de datos revisar que este correcto el nombre del archivo y ubicacion elco_reports_25-07-2019_8h45m06s.sql
cd C:\Archivos de Programa\MySQL\MySQL Server 5.0\bin
mysql -uroot CREATE DATABASE elco_reports;
set/p nombre= Pon el nombre archivo que esta dentro de C:/Backups .sql que quieres importar al mysql:
mysql -uroot elco_reports < "F:\Backups\%nombre%"
exit