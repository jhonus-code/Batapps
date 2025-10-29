@ECHO OFF
cd C://
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


exit