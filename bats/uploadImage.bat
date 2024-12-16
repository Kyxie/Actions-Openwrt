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

REM 上传 openwrt-x86-64-generic-ext4-rootfs.img.gz
scp -i ../../.pem ./openwrt-x86-64-generic-ext4-rootfs.img.gz %remote_user%@%remote_host%:%remote_image_path%

if %errorlevel%==0 (
    echo openwrt-x86-64-generic-ext4-rootfs.img.gz 已成功上传到远程服务器。
) else (
    echo 上传失败，请检查连接或路径设置。
)

pause
