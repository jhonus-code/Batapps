@echo off
REM Crea/modifica el valor REG_DWORD {2cc5ca98-6485-489a-920e-b3e88a6ccce3} en:
REM HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel

set "KEY=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
set "VAL={2cc5ca98-6485-489a-920e-b3e88a6ccce3}"

REM Establecer el valor a 1 (ocultar en el escritorio del "NewStartPanel")
reg add "%KEY%" /v "%VAL%" /t REG_DWORD /d 1 /f

IF ERRORLEVEL 1 (
  echo [ERROR] No se pudo crear/modificar el valor.
  exit /b 1
) ELSE (
  echo [OK] Valor creado/modificado correctamente.
)

REM (Opcional) Forzar a Explorer a recargar la configuración:
REM Si no ves el cambio inmediato, descomenta las dos lineas siguientes.
REM taskkill /f /im explorer.exe >nul 2>&1
REM start explorer.exe