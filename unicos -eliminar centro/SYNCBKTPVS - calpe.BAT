::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGIroL5uT07u6Unk4RW/c7NobY1dQ=
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
::cxY6rQJ7JhzQF1fEqQJhZksaHErQXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXoZg==
::ZQ05rAF9IAHYFVzEqQIDETV3bi+2DF2JZg==
::eg0/rx1wNQPfEVWB+kM9LVsJDDe7EkiYLYEs3tub
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWHSF51Y1OhhYQxGGXA==
::YQ03rBFzNR3SWATE2UMjPB5GTwiNKW/a
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wKgIURgyNMgs=
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9alo1khQew2e4DImvmLLOke40vlZ9Yu03ROisQwPyJ2XTCAWj8CmiMCtWWJJ8LSthfkKg==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@ECHO OFF
title SYNCBKTPVS calpe
::no tocar variables de tiempo
SET fecha="%date:~0,2%-%date:~3,2%-%date:~6,4%"
set hora="%time:~0,2%h%time:~3,2%m%time:~6,4%s"
::CREACION SI NO EXISTE CARPETAS
CD C:\bat
IF exist LOGS ( echo *************************** ya existe carpeta LOGS *************************** ) ELSE ( MD LOGS )
CD C:\
IF exist Backups ( echo *************************** ya existe carpeta Backups ***************************) ELSE ( MD Backups )
IF exist BackupsMandos ( echo *************************** ya existe carpeta BackupsMandos ***************************) ELSE ( MD BackupsMandos )
IF exist Bat ( echo *************************** ya existe carpeta Bat ***************************) ELSE ( MD Bat )
::condiciones de copiado a tpvs
IF exist "\\CAJA2\disco\" ( Robocopy /MIR C:\Backups\  \\CAJA2\disco\Backups\ ) ELSE ( echo %fecha% %hora% TPV2 OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
IF exist "\\CAJA3\disco177\" ( Robocopy /MIR C:\Backups\  \\CAJA3\disco177\Backups\ ) ELSE ( echo %fecha% %hora% TPV3 OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
IF exist "\\CAJA4\disco178\" ( Robocopy /MIR C:\Backups\  \\CAJA4\disco178\Backups\ ) ELSE ( echo %fecha% %hora% TPV4 OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
::condiciones de copiado a tpvs 2
IF exist "\\CAJA2\disco\" ( Robocopy /MIR C:\BackupsMandos\  \\CAJA2\disco\BackupsMandos\ ) ELSE ( echo %fecha% %hora% TPV2 OFF >C:\Bat\LOGS\logssyncbackupmandos_%fecha%_%hora%.txt )
IF exist "\\CAJA3\disco177\" ( Robocopy /MIR C:\BackupsMandos\  \\CAJA3\disco177\BackupsMandos\ ) ELSE ( echo %fecha% %hora% TPV3 OFF >C:\Bat\LOGS\logssyncbackupmandos_%fecha%_%hora%.txt )
IF exist "\\CAJA4\disco178\" ( Robocopy /MIR C:\BackupsMandos\  \\CAJA4\disco178\BackupsMandos\ ) ELSE ( echo %fecha% %hora% TPV4 OFF >C:\Bat\LOGS\logssyncbackupmandos_%fecha%_%hora%.txt )
::condiciones de copiado a tpvs 3
IF exist "\\CAJA2\disco\" ( Robocopy /MIR C:\Bat\  \\CAJA2\disco\Bat\ ) ELSE ( echo %fecha% %hora% TPV2 OFF >C:\Bat\LOGS\logssyncBat_%fecha%_%hora%.txt )
IF exist "\\CAJA3\disco177\" ( Robocopy /MIR C:\Bat\  \\CAJA3\disco177\Bat\ ) ELSE ( echo %fecha% %hora% TPV3 OFF >C:\Bat\LOGS\logssyncBat_%fecha%_%hora%.txt )
IF exist "\\CAJA4\disco178\" ( Robocopy /MIR C:\Bat\  \\CAJA4\disco178\Bat\ ) ELSE ( echo %fecha% %hora% TPV4 OFF >C:\Bat\LOGS\logssyncBat_%fecha%_%hora%.txt )
exit