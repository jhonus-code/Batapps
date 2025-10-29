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
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9azrUkSaNMqfc/S1KeaIewS+AX0dIQslnJVi98JABhXQgiIYRw1ui5MuSSKNcuVtA71RVqA51hwC2BmiCPAgzgyYt9tiYMN1iO770T7nqEVwkTMV7oaEG6h461rM9wQwSi1fHX7o512aN3aW4vaTTPQJgk=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@ECHO OFF
title SYNCBKTPVS
::no tocar variables de tiempo
SET fecha="%date:~0,2%-%date:~3,2%-%date:~6,4%"
set hora="%time:~0,2%h%time:~3,2%m%time:~6,4%s"
::CREACION SI NO EXISTE CARPETAS
CD C:\Bat
IF exist LOGS ( echo *************************** ya existe carpeta LOGS *************************** ) ELSE ( MD LOGS )
CD C:\
IF exist Backups ( echo *************************** ya existe carpeta Backups ***************************) ELSE ( MD Backups )
IF exist BackupsMandos ( echo *************************** ya existe carpeta BackupsMandos ***************************) ELSE ( MD BackupsMandos )
IF exist Bat ( echo *************************** ya existe carpeta Bat ***************************) ELSE ( MD Bat )
::condiciones de copiado a tpvs 2
IF exist "\\192.168.1.176\c$\" ( Robocopy /MIR C:\Backups\  \\192.168.1.176\c$\Backups\ ) ELSE ( echo %fecha% %hora% TPV2 OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
IF exist "\\192.168.1.176\c$\" ( Robocopy /MIR C:\BackupsMandos\  \\192.168.1.176\c$\BackupsMandos\ ) ELSE ( echo %fecha% %hora% TPV2 OFF >C:\Bat\LOGS\logssyncbackupmandos_%fecha%_%hora%.txt )
IF exist "\\192.168.1.176\c$\" ( Robocopy /MIR C:\Bat\  \\192.168.1.176\c$\Bat\ ) ELSE ( echo %fecha% %hora% TPV2 OFF >C:\Bat\LOGS\logssyncBat_%fecha%_%hora%.txt )

::condiciones de copiado a tpvs 3
IF exist "\\192.168.1.177\c$\" ( Robocopy /MIR C:\BackupsMandos\  \\192.168.1.177\c$\BackupsMandos\ ) ELSE ( echo %fecha% %hora% TPV3 OFF >C:\Bat\LOGS\logssyncbackupmandos_%fecha%_%hora%.txt )
IF exist "\\192.168.1.177\c$\" ( Robocopy /MIR C:\Backups\  \\192.168.1.177\c$\Backups\ ) ELSE ( echo %fecha% %hora% TPV3 OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
IF exist "\\192.168.1.177\c$\" ( Robocopy /MIR C:\Bat\  \\192.168.1.177\c$\Bat\ ) ELSE ( echo %fecha% %hora% TPV3 OFF >C:\Bat\LOGS\logssyncBat_%fecha%_%hora%.txt )

::condiciones de copiado a tpvs 4
IF exist "\\192.168.1.178\c$\" ( Robocopy /MIR C:\Bat\  \\192.168.1.178\c$\Bat\ ) ELSE ( echo %fecha% %hora% TPV4 OFF >C:\Bat\LOGS\logssyncBat_%fecha%_%hora%.txt )
IF exist "\\192.168.1.178\c$\" ( Robocopy /MIR C:\Backups\  \\192.168.1.178\c$\Backups\ ) ELSE ( echo %fecha% %hora% TPV4 OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
IF exist "\\192.168.1.178\c$\" ( Robocopy /MIR C:\BackupsMandos\  \\192.168.1.178\c$\BackupsMandos\ ) ELSE ( echo %fecha% %hora% TPV4 OFF >C:\Bat\LOGS\logssyncbackupmandos_%fecha%_%hora%.txt )


exit