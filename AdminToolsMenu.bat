@echo off
setlocal EnableExtensions EnableDelayedExpansion
chcp 65001 >nul
title Admin Tools Menu (Win11 / Windows Server)
color 0A

:: Arranca en el menú principal
goto :detect_os

:: ------------------------------------------------------------
:: Helpers
:: ------------------------------------------------------------
:launch
:: Lanza .msc/.cpl/.exe o URIs ms-settings: y http/https
:: Uso: call :launch objetivo [args...]
set "target=%~1"
set "args="
shift
:collect_args
if "%~1"=="" goto after_args
set "args=%args% %1"
shift
goto collect_args
:after_args

if not defined target goto :eof

:: ms-settings:
set "prefix12=!target:~0,12!"
if /I "!prefix12!"=="ms-settings:" (
  start "" "!target!"
  goto :eof
)

:: http/https
set "prefix4=!target:~0,4!"
if /I "!prefix4!"=="http" (
  start "" "!target!"
  goto :eof
)

:: Detectar extensión (últimos 4 chars)
set "ext=!target:~-4!"

:: .MSC vía MMC
if /I "!ext!"==".msc" (
  if exist "%SystemRoot%\System32\!target!" (
    echo [>] Abriendo !target!...
    start "" mmc.exe "%SystemRoot%\System32\!target!" !args!
  ) else (
    echo [>] Abriendo !target!...
    start "" mmc.exe "!target!" !args!
  )
  goto :eof
)

:: .CPL
if /I "!ext!"==".cpl" (
  if exist "%SystemRoot%\System32\!target!" (
    echo [>] Abriendo !target!...
    start "" "%SystemRoot%\System32\!target!" !args!
  ) else (
    echo [>] Abriendo !target!...
    start "" "!target!" !args!
  )
  goto :eof
)

:: EXE por WHERE / PATH / System32 / ruta absoluta
where /Q "!target!" 2>nul
if not errorlevel 1 (
  echo [>] Abriendo !target! !args!
  start "" "!target!" !args!
  goto :eof
)
if exist "!target!" (
  echo [>] Abriendo !target! !args!
  start "" "!target!" !args!
  goto :eof
)
if exist "%SystemRoot%\System32\!target!" (
  echo [>] Abriendo !target! !args!
  start "" "%SystemRoot%\System32\!target!" !args!
) else (
  echo [X] No encontrado: !target!
)
goto :eof

:presskey
echo.
pause >nul
goto :eof

:require_admin
>nul 2>&1 net session
if errorlevel 1 (
  echo.
  echo [!] Esta accion requiere ejecutar como Administrador.
  echo     ¿Elevar ahora? (S/N)
  set /p "_elev=> "
  if /I "!_elev!"=="S" (
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
  )
  echo.
  echo Continuando sin elevacion...
)
goto :eof

:: ------------------------------------------------------------
:: Deteccion de SO
:: ------------------------------------------------------------
:detect_os
for /f %%a in ('powershell -NoProfile -Command "(Get-CimInstance Win32_OperatingSystem).ProductType"') do set "PRODUCTTYPE=%%a"
:: 1=Cliente (Workstation: Windows 10/11), 2=Domain Controller, 3=Server
if "%PRODUCTTYPE%"=="1" (set "OSKIND=CLIENT") else (set "OSKIND=SERVER")
goto :main

:: ------------------------------------------------------------
:: Menú principal
:: ------------------------------------------------------------
:main
cls
echo ============================================================
echo           MENÚ PRINCIPAL - AdminToolsMenu (Batch)
echo ============================================================
echo Detectado: %OSKIND%
echo.
echo  1) Windows 11 (Cliente) - Herramientas y RSAT
echo  2) Windows Server       - Roles y consolas
echo  3) Comunes (valen en ambos)
echo  4) Instalar RSAT (clientes Windows 10/11)
echo.
echo  0) Salir
echo.
set /p opt=Elige opcion: 
if "%opt%"=="1"  goto win11_main
if "%opt%"=="2"  goto server_main
if "%opt%"=="3"  goto common_main
if "%opt%"=="4"  goto menu_rsat
if "%opt%"=="0"  goto end
goto main

:: ============================================================
:: WINDOWS 11 (CLIENTE)
:: ============================================================
:win11_main
cls
echo === WINDOWS 11 (Cliente) ==================================
echo  1) AD / RSAT (si instalado)
echo  2) Red / Seguridad
echo  3) Sistema (cliente)
echo  4) Almacenamiento
echo  5) Roles opcionales (IIS / Hyper-V / Impresion)
echo  6) Consolas / Terminales
echo  7) Extras (Azure/SQL/WAC si presentes)
echo  0) Volver
echo.
set /p s=Elige: 
if "%s%"=="1" goto w11_ad
if "%s%"=="2" goto w11_netsec
if "%s%"=="3" goto w11_system
if "%s%"=="4" goto w11_storage
if "%s%"=="5" goto w11_roles
if "%s%"=="6" goto menu_shells
if "%s%"=="7" goto extras_both
if "%s%"=="0" goto main
goto win11_main

:w11_ad
cls
echo === Win11 - AD / RSAT =====================================
echo  1) ADAC - Centro de administracion (dsac.exe)
echo  2) ADUC - Usuarios y equipos (dsa.msc)
echo  3) Sitios y servicios (dssite.msc)
echo  4) Dominios y confianzas (domain.msc)
echo  5) ADSI Edit (adsiedit.msc)
echo  6) Esquema de AD (schmmgmt.msc)
echo  7) GPMC - Administracion de directivas (gpmc.msc)
echo  8) Editor de directiva local (gpedit.msc)
echo  9) RSoP - Resultado de directiva (rsop.msc)
echo 10) DNS Manager (dnsmgmt.msc)
echo 11) DHCP Manager (dhcpmgmt.msc)
echo 12) DFS Management (dfsmgmt.msc)
echo 13) Cert Authority (certsrv.msc)
echo 14) Plantillas de certificado (certtmpl.msc)
echo 15) AD PowerShell (Import-Module ActiveDirectory)
echo 16) DNS PowerShell (Import-Module DnsServer)
echo 17) DHCP PowerShell (Import-Module DhcpServer)
echo  0) Volver
echo.
set /p x=Elige: 
if "%x%"=="1"  call :launch dsac.exe
if "%x%"=="2"  call :launch dsa.msc
if "%x%"=="3"  call :launch dssite.msc
if "%x%"=="4"  call :launch domain.msc
if "%x%"=="5"  call :launch adsiedit.msc
if "%x%"=="6"  call :launch schmmgmt.msc
if "%x%"=="7"  call :launch gpmc.msc
if "%x%"=="8"  call :launch gpedit.msc
if "%x%"=="9"  call :launch rsop.msc
if "%x%"=="10" call :launch dnsmgmt.msc
if "%x%"=="11" call :launch dhcpmgmt.msc
if "%x%"=="12" call :launch dfsmgmt.msc
if "%x%"=="13" call :launch certsrv.msc
if "%x%"=="14" call :launch certtmpl.msc
if "%x%"=="15" call :launch powershell.exe -NoExit -Command Import-Module ActiveDirectory
if "%x%"=="16" call :launch powershell.exe -NoExit -Command Import-Module DnsServer
if "%x%"=="17" call :launch powershell.exe -NoExit -Command Import-Module DhcpServer
if "%x%"=="0"  goto win11_main
goto w11_ad

:w11_netsec
cls
echo === Win11 - Red / Seguridad ===============================
echo  1) Conexiones de red (ncpa.cpl)
echo  2) Centro de redes (control.exe /name Microsoft.NetworkAndSharingCenter)
echo  3) Firewall Windows - Avanzado (wf.msc)
echo  4) Firewall Windows - Basico (firewall.cpl)
echo  5) Política de seguridad local (secpol.msc)
echo  6) Opciones de Internet (inetcpl.cpl)
echo  7) Windows Update (ms-settings:windowsupdate)
echo  8) Administrador de credenciales (control.exe /name Microsoft.CredentialManager)
echo  0) Volver
echo.
set /p x=Elige: 
if "%x%"=="1" call :launch ncpa.cpl
if "%x%"=="2" call :launch control.exe /name Microsoft.NetworkAndSharingCenter
if "%x%"=="3" call :launch wf.msc
if "%x%"=="4" call :launch firewall.cpl
if "%x%"=="5" call :launch secpol.msc
if "%x%"=="6" call :launch inetcpl.cpl
if "%x%"=="7" call :launch ms-settings:windowsupdate
if "%x%"=="8" call :launch control.exe /name Microsoft.CredentialManager
if "%x%"=="0" goto win11_main
goto w11_netsec

:w11_system
cls
echo === Win11 - Sistema (cliente) =============================
echo  1) Administracion de equipos (compmgmt.msc)
echo  2) Administrador de dispositivos (devmgmt.msc)
echo  3) Visor de eventos (eventvwr.msc)
echo  4) Servicios (services.msc)
echo  5) Programador de tareas (taskschd.msc)
echo  6) Rendimiento (perfmon.msc)
echo  7) Monitor de recursos (resmon.exe)
echo  8) Informacion del sistema (msinfo32.exe)
echo  9) Editor del Registro (regedit.exe)
echo 10) Propiedades del sistema (sysdm.cpl)
echo 11) Cambiar nombre/dominio (SystemPropertiesComputerName.exe)
echo 12) Usuarios locales y grupos (lusrmgr.msc)
echo 13) Usuarios avanzados (netplwiz)
echo 14) Caracteristicas de Windows (OptionalFeatures.exe)
echo 15) Administrador de tareas (taskmgr.exe)
echo  0) Volver
echo.
set /p x=Elige:
if "%x%"=="1"  call :launch compmgmt.msc
if "%x%"=="2"  call :launch devmgmt.msc
if "%x%"=="3"  call :launch eventvwr.msc
if "%x%"=="4"  call :launch services.msc
if "%x%"=="5"  call :launch taskschd.msc
if "%x%"=="6"  call :launch perfmon.msc
if "%x%"=="7"  call :launch resmon.exe
if "%x%"=="8"  call :launch msinfo32.exe
if "%x%"=="9"  call :launch regedit.exe
if "%x%"=="10" call :launch sysdm.cpl
if "%x%"=="11" call :launch SystemPropertiesComputerName.exe
if "%x%"=="12" call :launch lusrmgr.msc
if "%x%"=="13" call :launch netplwiz
if "%x%"=="14" call :launch OptionalFeatures.exe
if "%x%"=="15" call :launch taskmgr.exe
if "%x%"=="0"  goto win11_main
goto w11_system

:w11_storage
cls
echo === Win11 - Almacenamiento ================================
echo  1) Administracion de discos (diskmgmt.msc)
echo  2) Carpetas compartidas (fsmgmt.msc)
echo  3) Iniciador iSCSI (iscsicpl.exe)
echo  4) Desfragmentar / Optimizar (dfrgui.exe)
echo  5) Limpieza de disco (cleanmgr.exe)
echo  6) BitLocker (control.exe /name Microsoft.BitLockerDriveEncryption)
echo  7) Espacios de almacenamiento (control.exe /name Microsoft.StorageSpaces)
echo  0) Volver
echo.
set /p x=Elige:
if "%x%"=="1" call :launch diskmgmt.msc
if "%x%"=="2" call :launch fsmgmt.msc
if "%x%"=="3" call :launch iscsicpl.exe
if "%x%"=="4" call :launch dfrgui.exe
if "%x%"=="5" call :launch cleanmgr.exe
if "%x%"=="6" call :launch control.exe /name Microsoft.BitLockerDriveEncryption
if "%x%"=="7" call :launch control.exe /name Microsoft.StorageSpaces
if "%x%"=="0" goto win11_main
goto w11_storage

:w11_roles
cls
echo === Win11 - Roles opcionales ==============================
echo  1) IIS Manager (inetmgr.exe)
echo  2) Hyper-V Manager (virtmgmt.msc)
echo  3) Hyper-V VM Connect (vmconnect.exe)
echo  4) Administracion de impresion (printmanagement.msc)
echo  0) Volver
echo.
set /p x=Elige:
if "%x%"=="1" call :launch inetmgr.exe
if "%x%"=="2" call :launch virtmgmt.msc
if "%x%"=="3" call :launch vmconnect.exe
if "%x%"=="4" call :launch printmanagement.msc
if "%x%"=="0" goto win11_main
goto w11_roles

:: ============================================================
:: WINDOWS SERVER
:: ============================================================
:server_main
cls
echo === WINDOWS SERVER ========================================
echo  1) Roles principales (AD DS / DNS / DHCP / GPO / RDS / IIS / Hyper-V)
echo  2) Almacenamiento y ficheros (FSRM / Backup / iSCSI / Compartidos)
echo  3) Cluster y HA (Failover Cluster, modulos PS)
echo  4) Red / Seguridad (NPS / RRAS / Firewall / IPAM)
echo  5) Sistema (Server Manager, perf, etc.)
echo  6) Extras (DFS / WDS / WSUS / WAC / Print)
echo  7) Consolas / Terminales
echo  0) Volver
echo.
set /p s=Elige:
if "%s%"=="1" goto srv_roles
if "%s%"=="2" goto srv_storage
if "%s%"=="3" goto srv_cluster
if "%s%"=="4" goto srv_netsec
if "%s%"=="5" goto srv_system
if "%s%"=="6" goto srv_extras
if "%s%"=="7" goto menu_shells
if "%s%"=="0" goto main
goto server_main

:srv_roles
cls
echo === Server - Roles principales ============================
echo  1) Server Manager (ServerManager.exe)
echo  2) ADAC - Centro de administracion (dsac.exe)
echo  3) ADUC - Usuarios y equipos (dsa.msc)
echo  4) Sitios y servicios (dssite.msc)
echo  5) Dominios y confianzas (domain.msc)
echo  6) ADSI Edit (adsiedit.msc)
echo  7) Esquema de AD (schmmgmt.msc)
echo  8) GPMC - Administracion de directivas (gpmc.msc)
echo  9) DNS Manager (dnsmgmt.msc)
echo 10) DHCP Manager (dhcpmgmt.msc)
echo 11) RDS Licensing (licmgr.exe)
echo 12) RD Gateway Manager (tsgateway.msc)
echo 13) IIS Manager (inetmgr.exe)
echo 14) Hyper-V Manager (virtmgmt.msc)
echo 15) VM Connect (vmconnect.exe)
echo 16) Group Policy PS (Import-Module GroupPolicy)
echo 17) AD PS (Import-Module ActiveDirectory)
echo  0) Volver
echo.
set /p x=Elige:
if "%x%"=="1"  call :launch ServerManager.exe
if "%x%"=="2"  call :launch dsac.exe
if "%x%"=="3"  call :launch dsa.msc
if "%x%"=="4"  call :launch dssite.msc
if "%x%"=="5"  call :launch domain.msc
if "%x%"=="6"  call :launch adsiedit.msc
if "%x%"=="7"  call :launch schmmgmt.msc
if "%x%"=="8"  call :launch gpmc.msc
if "%x%"=="9"  call :launch dnsmgmt.msc
if "%x%"=="10" call :launch dhcpmgmt.msc
if "%x%"=="11" call :launch licmgr.exe
if "%x%"=="12" call :launch tsgateway.msc
if "%x%"=="13" call :launch inetmgr.exe
if "%x%"=="14" call :launch virtmgmt.msc
if "%x%"=="15" call :launch vmconnect.exe
if "%x%"=="16" call :launch powershell.exe -NoExit -Command Import-Module GroupPolicy
if "%x%"=="17" call :launch powershell.exe -NoExit -Command Import-Module ActiveDirectory
if "%x%"=="0"  goto server_main
goto srv_roles

:srv_storage
cls
echo === Server - Almacenamiento y ficheros ====================
echo  1) FSRM - File Server Resource Manager (fsrm.msc)
echo  2) Windows Server Backup (wbadmin.msc)
echo  3) Administracion de discos (diskmgmt.msc)
echo  4) Carpetas compartidas (fsmgmt.msc)
echo  5) Iniciador iSCSI (iscsicpl.exe)
echo  6) Storage Spaces (control.exe /name Microsoft.StorageSpaces)
echo  7) Limpieza de disco (cleanmgr.exe)
echo  0) Volver
echo.
set /p x=Elige:
if "%x%"=="1" call :launch fsrm.msc
if "%x%"=="2" call :launch wbadmin.msc
if "%x%"=="3" call :launch diskmgmt.msc
if "%x%"=="4" call :launch fsmgmt.msc
if "%x%"=="5" call :launch iscsicpl.exe
if "%x%"=="6" call :launch control.exe /name Microsoft.StorageSpaces
if "%x%"=="7" call :launch cleanmgr.exe
if "%x%"=="0" goto server_main
goto srv_storage

:srv_cluster
cls
echo === Server - Cluster y Alta Disponibilidad ================
echo  1) Failover Cluster Manager (cluadmin.msc)
echo  2) Failover Clusters PS (Import-Module FailoverClusters)
echo  3) Storage Replica PS (Import-Module StorageReplica)
echo  0) Volver
echo.
set /p x=Elige:
if "%x%"=="1" call :launch cluadmin.msc
if "%x%"=="2" call :launch powershell.exe -NoExit -Command Import-Module FailoverClusters
if "%x%"=="3" call :launch powershell.exe -NoExit -Command Import-Module StorageReplica
if "%x%"=="0" goto server_main
goto srv_cluster

:srv_netsec
cls
echo === Server - Red / Seguridad ==============================
echo  1) Conexiones de red (ncpa.cpl)
echo  2) Firewall avanzado (wf.msc)
echo  3) Politica de seguridad local (secpol.msc)
echo  4) NPS - Network Policy Server (nps.msc)
echo  5) RRAS - Routing and Remote Access (rrasmgmt.msc)
echo  6) IPAM (ipamclnt.msc)
echo  7) Windows Update (ms-settings:windowsupdate)
echo  0) Volver
echo.
set /p x=Elige:
if "%x%"=="1" call :launch ncpa.cpl
if "%x%"=="2" call :launch wf.msc
if "%x%"=="3" call :launch secpol.msc
if "%x%"=="4" call :launch nps.msc
if "%x%"=="5" call :launch rrasmgmt.msc
if "%x%"=="6" call :launch ipamclnt.msc
if "%x%"=="7" call :launch ms-settings:windowsupdate
if "%x%"=="0" goto server_main
goto srv_netsec

:srv_system
cls
echo === Server - Sistema ======================================
echo  1) Server Manager (ServerManager.exe)
echo  2) Administracion de equipos (compmgmt.msc)
echo  3) Administrador de dispositivos (devmgmt.msc)
echo  4) Visor de eventos (eventvwr.msc)
echo  5) Servicios (services.msc)
echo  6) Programador de tareas (taskschd.msc)
echo  7) Rendimiento (perfmon.msc)
echo  8) Monitor de recursos (resmon.exe)
echo  9) Editor del Registro (regedit.exe)
echo 10) Propiedades del sistema (sysdm.cpl)
echo 11) Cambiar nombre/dominio (SystemPropertiesComputerName.exe)
echo 12) Administracion de impresion (printmanagement.msc)
echo  0) Volver
echo.
set /p x=Elige:
if "%x%"=="1"  call :launch ServerManager.exe
if "%x%"=="2"  call :launch compmgmt.msc
if "%x%"=="3"  call :launch devmgmt.msc
if "%x%"=="4"  call :launch eventvwr.msc
if "%x%"=="5"  call :launch services.msc
if "%x%"=="6"  call :launch taskschd.msc
if "%x%"=="7"  call :launch perfmon.msc
if "%x%"=="8"  call :launch resmon.exe
if "%x%"=="9"  call :launch regedit.exe
if "%x%"=="10" call :launch sysdm.cpl
if "%x%"=="11" call :launch SystemPropertiesComputerName.exe
if "%x%"=="12" call :launch printmanagement.msc
if "%x%"=="0"  goto server_main
goto srv_system

:srv_extras
cls
echo === Server - Extras (segun roles instalados) ==============
echo  1) DFS Management (dfsmgmt.msc)
echo  2) WDS - Servicios de implementacion (wdsmgmt.msc)
echo  3) WSUS - Update Services (wsus.msc)
echo  4) AD CS - Autoridad de certificacion (certsrv.msc)
echo  5) Plantillas de certificado (certtmpl.msc)
echo  6) Windows Admin Center (SmeDesktop.exe o https://localhost:6516)
echo  0) Volver
echo.
set /p x=Elige:
if "%x%"=="1" call :launch dfsmgmt.msc
if "%x%"=="2" call :launch wdsmgmt.msc
if "%x%"=="3" call :launch wsus.msc
if "%x%"=="4" call :launch certsrv.msc
if "%x%"=="5" call :launch certtmpl.msc
if "%x%"=="6" (
  if exist "C:\Program Files\Windows Admin Center\SmeDesktop.exe" (
    call :launch "C:\Program Files\Windows Admin Center\SmeDesktop.exe"
  ) else (
    call :launch https://localhost:6516/
  )
)
if "%x%"=="0" goto server_main
goto srv_extras

:: ============================================================
:: COMUNES (AMBOS)
:: ============================================================
:common_main
cls
echo === COMUNES (Win11 y Server) ==============================
echo  1) Certificados - Equipo local (certlm.msc)
echo  2) Certificados - Usuario actual (certmgr.msc)
echo  3) Editor de directiva local (gpedit.msc)
echo  4) Panel de control (control.exe)
echo  5) Windows Terminal (wt.exe)
echo  6) PowerShell 7 (pwsh.exe)
echo  7) Windows PowerShell (powershell.exe)
echo  8) PowerShell ISE (powershell_ise.exe)
echo  9) CMD (cmd.exe)
echo 10) Event Viewer (eventvwr.msc)
echo  0) Volver
echo.
set /p x=Elige:
if "%x%"=="1" call :launch certlm.msc
if "%x%"=="2" call :launch certmgr.msc
if "%x%"=="3" call :launch gpedit.msc
if "%x%"=="4" call :launch control.exe
if "%x%"=="5" call :launch wt.exe
if "%x%"=="6" call :launch pwsh.exe
if "%x%"=="7" call :launch powershell.exe
if "%x%"=="8" call :launch powershell_ise.exe
if "%x%"=="9" call :launch cmd.exe
if "%x%"=="10" call :launch eventvwr.msc
if "%x%"=="0" goto main
goto common_main

:: ============================================================
:: Consolas / Terminales (reusado por ambos)
:: ============================================================
:menu_shells
cls
echo === Consolas / Terminales =================================
echo  1) Windows Terminal (wt.exe)
echo  2) PowerShell 7 (pwsh.exe)
echo  3) Windows PowerShell (powershell.exe)
echo  4) PowerShell ISE (powershell_ise.exe)
echo  5) CMD (cmd.exe)
echo  6) PS con modulo AD (Import-Module ActiveDirectory)
echo  7) PS con modulo DnsServer (Import-Module DnsServer)
echo  8) PS con modulo Hyper-V (Import-Module Hyper-V)
echo  0) Volver
echo.
set /p x=Elige:
if "%x%"=="1" call :launch wt.exe
if "%x%"=="2" call :launch pwsh.exe
if "%x%"=="3" call :launch powershell.exe
if "%x%"=="4" call :launch powershell_ise.exe
if "%x%"=="5" call :launch cmd.exe
if "%x%"=="6" call :launch powershell.exe -NoExit -Command Import-Module ActiveDirectory
if "%x%"=="7" call :launch powershell.exe -NoExit -Command Import-Module DnsServer
if "%x%"=="8" call :launch powershell.exe -NoExit -Command Import-Module Hyper-V
if "%x%"=="0" goto main
goto menu_shells

:: ============================================================
:: EXTRAS (Azure/SQL/WAC) para Win11 y Server si existen
:: ============================================================
:extras_both
cls
echo === Extras (si instalados / en PATH) ======================
echo  1) SQL Server Management Studio (ssms.exe)
echo  2) Azure Data Studio (azuredatastudio.exe)
echo  3) Windows Admin Center (SmeDesktop.exe o https://localhost:6516)
echo  0) Volver
echo.
set /p x=Elige:
if "%x%"=="1" call :launch ssms.exe
if "%x%"=="2" call :launch azuredatastudio.exe
if "%x%"=="3" (
  if exist "C:\Program Files\Windows Admin Center\SmeDesktop.exe" (
    call :launch "C:\Program Files\Windows Admin Center\SmeDesktop.exe"
  ) else (
    call :launch https://localhost:6516/
  )
)
if "%x%"=="0" goto main
goto extras_both

:: ============================================================
:: RSAT (Clientes)
:: ============================================================
:menu_rsat
cls
echo === RSAT (Windows 10/11 cliente) ==========================
echo  Nota: En Windows Server usa "Agregar roles y caracteristicas".
echo.
echo  1) Instalar RSAT basico (AD, DNS, DHCP, GPMC, RDS)
echo  2) Instalar TODO RSAT conocido
echo  3) Habilitar herramientas de Hyper-V (cliente)
echo  0) Volver
echo.
set /p s=Elige:
if "%s%"=="1" goto rsat_basic
if "%s%"=="2" goto rsat_all
if "%s%"=="3" goto rsat_hv
if "%s%"=="0" goto main
goto menu_rsat

:rsat_basic
call :require_admin
echo.
echo [>] Instalando RSAT basico...
dism /Online /Add-Capability /CapabilityName:Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0
dism /Online /Add-Capability /CapabilityName:Rsat.Dns.Tools~~~~0.0.1.0
dism /Online /Add-Capability /CapabilityName:Rsat.DHCP.Tools~~~~0.0.1.0
dism /Online /Add-Capability /CapabilityName:Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0
dism /Online /Add-Capability /CapabilityName:Rsat.RemoteDesktop.Services.Tools~~~~0.0.1.0
echo.
echo [i] Si alguna capacidad pide reinicio, reinicia el equipo.
call :presskey
goto menu_rsat

:rsat_all
call :require_admin
echo.
echo [>] Instalando todas las capacidades RSAT conocidas...
for %%C in (
  Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0
  Rsat.DHCP.Tools~~~~0.0.1.0
  Rsat.Dns.Tools~~~~0.0.1.0
  Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0
  Rsat.RemoteDesktop.Services.Tools~~~~0.0.1.0
  Rsat.FileServices.Tools~~~~0.0.1.0
  Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0
  Rsat.IPAM.Client.Tools~~~~0.0.1.0
  Rsat.NetworkController.Tools~~~~0.0.1.0
  Rsat.Shielded.VM.Tools~~~~0.0.1.0
  Rsat.StorageReplica.Tools~~~~0.0.1.0
  Rsat.VolumeActivation.Tools~~~~0.0.1.0
  Rsat.BitLocker.Recovery.Tools~~~~0.0.1.0
) do (
  echo --- %%C
  dism /Online /Add-Capability /CapabilityName:%%C
)
echo.
echo [i] Finalizado. Reinicia si alguna capacidad lo requiere.
call :presskey
goto menu_rsat

:rsat_hv
call :require_admin
echo.
echo [>] Habilitando herramientas de Hyper-V (cliente)...
dism /Online /Enable-Feature /FeatureName:Microsoft-Hyper-V-Tools-All /All
echo [i] Listo. Reinicia si se solicita.
call :presskey
goto menu_rsat

:end
echo.
echo Hasta luego.
endlocal
exit /b
