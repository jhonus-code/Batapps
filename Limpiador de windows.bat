@echo off

rem Limpiador de Windows

rem Borrar archivos temporales
del /f /s /q %temp%\*.*

rem Borrar archivos temporales del %userprofile%
del /f /s /q %userprofile%\temp\*.*

rem Borrar archivos temporales de Internet
del /f /s /q %userprofile%\cookies\*.*

rem Borrar archivos temporales de Internet
del /f /s /q %userprofile%\Local Settings\Temporary Internet Files\*.*

rem Borrar archivos temporales de la papelera
del /f /s /q %userprofile%\Local Settings\Recycle Bin\*.*

rem Borrar archivos del historial de Windows
del /f /s /q %userprofile%\Local Settings\History\*.*

rem Borrar archivos del historial de Internet
del /f /s /q %userprofile%\Local Settings\Application Data\Microsoft\Windows\WER\ReportArchive\*.*

rem Borrar archivos del historial de MS Office
del /f /s /q %userprofile%\Local Settings\Application Data\Microsoft\Office\Recent\*.*

rem Borrar archivos del caché de Windows
del /f /s /q %userprofile%\Local Settings\Application Data\Microsoft\Windows\UsrClass.dat

rem Borrar archivos de diagnóstico de Windows
del /f /s /q %userprofile%\Local Settings\Application Data\Microsoft\Windows\Diagnosis\*.*

rem Borrar archivos temporales de Windows
del /f /s /q %userprofile%\Local Settings\Application Data\Microsoft\Windows\Temporary Internet Files\Content.IE5\*.*

echo Limpieza completada.