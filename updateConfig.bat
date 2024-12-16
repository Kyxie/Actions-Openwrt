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

set KEY=../key.pem
set REMOTE_PATH=/home/admin/lede/.config
set LOCAL_PATH=.

echo Uploading file from %HOST%...
scp -i "%KEY%" %HOST%:%REMOTE_PATH% %LOCAL_PATH%

if %errorlevel% neq 0 (
    echo Error: SCP failed!
    exit /b %errorlevel%
)

echo File transfer completed successfully!

