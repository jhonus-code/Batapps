echo off
set cont=10
set cont2=0

:mysqlcd
cd "C:\Program Files\MySQL\MySQL Server 5.0\bin"
if %errorlevel%==0 (
goto mysqlrev
) else (
cls
cd "C:\Archivos de Programa\MySQL\MySQL Server 5.0\bin"
goto mysqlrev
)

:mysqlrev
for /f "delims=" %%a in ('mysql -uroot -N replica -e"select count(*) from    buffer"') do @set x=%%a
if %x%==0 (
cls
echo ---------------------------------------------------------------------------------
echo El TPV se apagara cuando acabe la cuenta atras, se esta sincronizando con central. 
echo No cierre ventana o no se apagara.
echo ---------------------------------------------------------------------------------
echo Proceso de cerrado final activado tiempo de espera 60 seg
timeout 60 /nobreak
goto salida
) else (
cls
echo ---------------------------------------------------------------------------------
echo El TPV se apagara cuando acabe la cuenta atras, se esta sincronizando con central. 
echo No cierre ventana o no se apagara.
echo ---------------------------------------------------------------------------------
echo Se detectaron %x% Lineas en el Buffer de la replica. Posponemos espera...
timeout 300 /nobreak
::contador +1
set /a cont+=1
echo Total Repeticiones: %cont%
if %cont% GEQ 10 (goto invalid) else (goto mysqlrev)

)

:invalid
echo LLevamos unos minutos intentando y la tabla buffer aun tiene lineas pasamos a reiniciar replica y Hamachi.
taskkill /IM hamachi-2-ui.exe /F
net stop Hamachi2Svc
timeout 10 /nobreak
net start Hamachi2Svc
taskkill /IM Replica.exe /F
cd C:\00RES\
START Replica.exe
timeout 65 /nobreak
set /a cont2+=1
echo Total Repeticiones: %cont2%
if %cont2% EQU 1 (goto mysqlrev&set /a cont=0) else (if %cont2% GEQ 3 (goto salidamail) else (goto mysqlrev)
)


:salida
shutdown -s -t 100
pause
