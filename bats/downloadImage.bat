@echo off
setlocal enabledelayedexpansion

REM 读取 settings.yaml 中的远程信息
for /f "tokens=2 delims=: " %%i in ('findstr "host" settings.yaml') do set remote_host=%%i
for /f "tokens=2 delims=: " %%i in ('findstr "username" settings.yaml') do set remote_user=%%i
for /f "tokens=2 delims=: " %%i in ('findstr "image_path" settings.yaml') do set remote_image_path=%%i

REM 删除换行符和空格
set remote_host=!remote_host: =!
set remote_user=!remote_user: =!
set remote_image_path=!remote_image_path: =!

REM 下载 openwrt.qcow2 文件
scp -i ../../.pem %remote_user%@%remote_host%:%remote_image_path% ./openwrt.qcow2

if %errorlevel%==0 (
    echo openwrt.qcow2 文件已成功下载到当前目录。
) else (
    echo 下载失败，请检查连接或路径设置。
)

pause
