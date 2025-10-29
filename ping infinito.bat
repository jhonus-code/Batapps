@echo off
cd C:\
set/p ip= Escribe la ip que quieres hacer ping:
powerping %ip% --w 5000 --t
pause