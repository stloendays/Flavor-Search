@echo off
chcp 65001 >nul
echo ========================================
echo    Flavor Database Setup
echo ========================================
echo.

:: 检查 MySQL 是否安装
echo [1/4] 检查 MySQL...
mysql --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 错误: 未找到 MySQL，请先安装 MySQL
    echo 下载地址: https://dev.mysql.com/downloads/mysql/
    echo 或者使用 XAMPP: https://www.apachefriends.org/
    pause
    exit /b 1
)
echo ✅ MySQL 已安装

:: 提示用户输入数据库信息
echo [2/4] 配置数据库连接...
set /p DB_PASSWORD="请输入 MySQL root 密码 (直接回车使用默认密码 123456): "
if "%DB_PASSWORD%"=="" set DB_PASSWORD=123456

:: 创建数据库和表
echo [3/4] 创建数据库和表...
mysql -u root -p%DB_PASSWORD% -e "CREATE DATABASE IF NOT EXISTS flavor_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" 2>nul
if errorlevel 1 (
    echo ❌ 数据库创建失败，请检查密码是否正确
    pause
    exit /b 1
)

:: 导入数据库结构
echo [4/4] 导入数据库结构...
mysql -u root -p%DB_PASSWORD% flavor_db < database/flavor_schema.sql 2>nul
if errorlevel 1 (
    echo ❌ 数据库结构导入失败
    pause
    exit /b 1
)

echo.
echo ========================================
echo ✅ 数据库设置完成！
echo ========================================
echo.
echo 📋 数据库信息:
echo    数据库名: flavor_db
echo    用户名: root
echo    密码: %DB_PASSWORD%
echo.
echo 🔧 更新后端配置:
echo    请确保 backend/.env 文件中的 DB_PASSWORD 设置为: %DB_PASSWORD%
echo.
echo 🚀 现在可以运行 start.bat 启动系统了！
echo.
pause 