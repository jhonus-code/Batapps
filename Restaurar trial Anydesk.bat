@echo

taskkill /IM "AnyDesk.exe" /F
RD /S "C:\ProgramData\AnyDesk"
RD /S "C:\Users\Jonatan\AppData\Roaming\AnyDesk"
cd "C:\Program Files (x86)\AnyDesk"
start AnyDesk.exe

pause