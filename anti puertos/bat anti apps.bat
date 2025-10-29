@echo off
:loop
taskkill /F /IM "chrome.exe"
taskkill /F /IM "AnyDesk.exe"
taskkill /F /IM "TeamViewer_Service.exe"
taskkill /F /IM "TeamViewer.exe"
taskkill /F /IM "iexplore.exe"
taskkill /F /IM "firefox.exe"
taskkill /F /IM "IperiusRemote.exe"
taskkill /F /IM "IperiusRemoteService.exe"

timeout /t 1 > nul
goto loop