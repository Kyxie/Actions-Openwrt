@echo off
if not exist host.txt (
    echo Error: host.txt not found!
    exit /b 1
)

set /p HOST=<host.txt

if "%HOST%"=="" (
    echo Error: host.txt is empty!
    exit /b 1
)

set FILE=openwrt-x86-64-generic-ext4-rootfs.img.gz
set REMOTE_DIR=/home/admin/images
set KEY=../key.pem

if not exist "%FILE%" (
    echo Error: File "%FILE%" not found!
    exit /b 1
)

echo Uploading %FILE% to %HOST%:%REMOTE_DIR%...
scp -i "%KEY%" "%FILE%" %HOST%:%REMOTE_DIR%

if %errorlevel% neq 0 (
    echo Error: File upload failed!
    exit /b %errorlevel%
)

echo File uploaded successfully to %HOST%:%REMOTE_DIR%!
