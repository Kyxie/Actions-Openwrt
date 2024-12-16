@echo off
setlocal enabledelayedexpansion

for /f "tokens=2 delims=: " %%i in ('findstr "host" settings.yaml') do set remote_host=%%i
for /f "tokens=2 delims=: " %%i in ('findstr "username" settings.yaml') do set remote_user=%%i
for /f "tokens=2 delims=: " %%i in ('findstr "config_path" settings.yaml') do set remote_config_path=%%i

set remote_host=!remote_host: =!
set remote_user=!remote_user: =!
set remote_config_path=!remote_config_path: =!

scp -i ..\..\key.pem %remote_user%@%remote_host%:%remote_config_path% ../

if %errorlevel%==0 (
    echo .config Download successful
) else (
    echo Download failed
)

pause
