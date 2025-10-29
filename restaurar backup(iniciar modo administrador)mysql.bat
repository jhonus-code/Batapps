::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGIroL5uT07u6UnkYUR/EvdoiW17WHLvQW5ETqdpNg1XVXiN4YCQkVdxGkYBx5qHtWuWmKNc6QtkLzT1iI71l9CG17ly7ZjyQ1LcFtidcMwSXz7ET8i7AC1GuyC6gMRWDkka84aJoGrFj6Oh+fyuUFE6W/Pu+4VmWedjtL3CCSy8s7180kXC8V
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
::ZQ05rAF9IAHYFVzEqQICDShgbTGwHVmXP4YtxKPL+u+VtkJ9
::eg0/rx1wNQPfEVWB+kM9LVsJDDanD1+bM4c92sXC3Nur6X0IUfArd+8=
::fBEirQZwNQPfEVWB+kM9LVsJDDanD1+bM4c92sXC3Nur6X0IUfArd+8=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWHSF51Y1OhhYQxGGXA==
::YQ03rBFzNR3SWATE2UMjPB5GTwiNKW/a
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wKgIUZgyNMgs=
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9alo1khWfssaYPn6JG9FMEm2GTWWK8e51YRqN4JHg9XMBeza28=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title RESTAURARMYSQL+Puerto
F:
set/p puerto= Pon el puerto centro a restaurar:
::parar servicio mysql5
net stop mysql%puerto%
timeout 10 /nobreak
cd F:\bbdd\mysql\mysql%puerto%\data
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
net start mysql%puerto%
echo *************************** Espera inicial para lanzar la restaurancion por mysql5 ***************************
timeout 10 /nobreak
::iniciar volcado de nuevo de la nueva base de datos revisar que este correcto el nombre del archivo y ubicacion elco_reports_25-07-2019_8h45m06s.sql
cd F:\bbdd\mysql\mysql%puerto%\bin
mysql -uroot CREATE DATABASE elco_reports;
set/p nombre= Pon el nombre archivo que esta dentro de F:\Backups .sql que quieres importar al mysql:

mysql -uroot --port=%puerto% elco_reports < "F:\Backups\%nombre%"
exit