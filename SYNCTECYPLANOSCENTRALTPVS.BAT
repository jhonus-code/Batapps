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
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9alo1khZ9sRW63w7oS4E64W8kCE
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@ECHO OFF
title SYNCTECYPLANOS
::no tocar variables de tiempo
SET fecha="%date:~0,2%-%date:~3,2%-%date:~6,4%"
set hora="%time:~0,2%h%time:~3,2%m%time:~6,4%s"
::CREACION SI NO EXISTE CARPETAS
CD C:\bat
IF exist LOGS ( echo *************************** ya existe carpeta LOGS *************************** ) ELSE ( MD LOGS )
CD C:\00RES_Central\00\

::CONDICIONES DE TPV master
IF exist "C:\00RES\TEC\" ( Robocopy /MIR C:\00RES_Central\00\TEC\  C:\00RES\TEC\ ) ELSE ( echo %fecha% %hora% TPV1 OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
IF exist "C:\00RES_M\TEC\" ( Robocopy /MIR C:\00RES_Central\01\TEC\  C:\00RES_M\TEC\ ) ELSE ( echo %fecha% %hora% TPV1B OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
IF exist "C:\00RES_M2\TEC\" ( Robocopy /MIR C:\00RES_Central\01\TEC\  C:\00RES_M2\TEC\ ) ELSE ( echo %fecha% %hora% TPV1C OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
::condiciones de copiado a tpvs 2
IF exist "\\192.168.1.176\c$\00RES\" ( Robocopy /MIR C:\00RES_Central\00\TEC\  \\192.168.1.176\c$\00RES\TEC\ ) ELSE ( echo %fecha% %hora% TPV2 OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
IF exist "\\192.168.1.176\c$\00RES_M\" ( Robocopy /MIR C:\00RES_Central\00\TEC\  \\192.168.1.176\c$\00RES_M\TEC\ ) ELSE ( echo %fecha% %hora% TPV2B OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
IF exist "\\192.168.1.176\c$\00RES_M2\" ( Robocopy /MIR C:\00RES_Central\00\TEC\  \\192.168.1.176\c$\00RES_M2\TEC\ ) ELSE ( echo %fecha% %hora% TPV2C OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
::condiciones de copiado a tpvs 3
IF exist "\\192.168.1.177\c$\00RES\" ( Robocopy /MIR C:\00RES_Central\00\TEC\  \\192.168.1.177\c$\00RES\TEC\ ) ELSE ( echo %fecha% %hora% TPV3 OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
IF exist "\\192.168.1.177\c$\00RES_M\" ( Robocopy /MIR C:\00RES_Central\00\TEC\  \\192.168.1.177\c$\00RES_M\TEC\ ) ELSE ( echo %fecha% %hora% TPV3B OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
IF exist "\\192.168.1.177\c$\00RES_M2\" ( Robocopy /MIR C:\00RES_Central\00\TEC\  \\192.168.1.177\c$\00RES_M2\TEC\ ) ELSE ( echo %fecha% %hora% TPV3C OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
:condiciones de copiado a tpvs 4
IF exist "\\192.168.1.178\c$\00RES\" ( Robocopy /MIR C:\00RES_Central\00\TEC\  \\192.168.1.178\c$\00RES\TEC\ ) ELSE ( echo %fecha% %hora% TPV4 OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
IF exist "\\192.168.1.178\c$\00RES_M\" ( Robocopy /MIR C:\00RES_Central\00\TEC\  \\192.168.1.178\c$\00RES_M\TEC\ ) ELSE ( echo %fecha% %hora% TPV4B OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )
IF exist "\\192.168.1.178\c$\00RES_M2\" ( Robocopy /MIR C:\00RES_Central\00\TEC\  \\192.168.1.178\c$\00RES_M2\TEC\ ) ELSE ( echo %fecha% %hora% TPV4C OFF >C:\Bat\LOGS\logsyncbacktotal_%fecha%_%hora%.txt )

exit