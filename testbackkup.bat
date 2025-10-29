@ECHO OFF

SET "mysqldump=C:\Program Files\MySQL\MySQL Server 5.0\bin\mysqldump.exe"
SET "database=elco_reports"
SET "user=root"
SET "backup=C:\Backups\%database%_%date:~-4%%date:~-7,2%%date:~-10,2%.sql"

cd C:\Archivos de Programa\MySQL\MySQL Server 5.0\bin
mysqldump --skip-opt --default-character-set=latin1 --extended-insert -u %user% %database% > %backup%

SET "load="
SET "loadnum=0"
SET "myapp=mysqldump.exe"

:cargando
SET "load=%load%┃"
CLS
ECHO:
ECHO     Realizando BackUp
ECHO ┏━━━━━━━━━━━━━━━━━━━━━━━━┓
ECHO  %load%
ECHO ┗━━━━━━━━━━━━━━━━━━━━━━━━┛
SET /A "loadnum+=1"
IF %loadnum% EQU 24 SET /A "loadnum=0" & SET "load="
TASKLIST /FI "IMAGENAME eq %myapp%" | FIND "%myapp%" > NUL
rem TASKLIST | FIND "%myapp%" > NUL
IF ERRORLEVEL 1 GOTO completado
GOTO cargando

:completado
CLS
ECHO:
ECHO     BACKUP COMPLETADO
ECHO ┏━━━━━━━━━━━━━━━━━━━━━━━━┓
ECHO  ┃┃┃┃┃┃┃┃┃┃┃┃┃┃┃┃┃┃┃┃┃┃┃┃
ECHO ┗━━━━━━━━━━━━━━━━━━━━━━━━┛
ECHO:
DIR | FIND "%database%"
PAUSE
