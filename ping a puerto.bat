@echo off
cd C:\
set/p ip= Escribe la ip que quieres hacer ping:
set/p puerto= Escribe el puerto que quieres testear:
tcping %ip% %puerto%
pause