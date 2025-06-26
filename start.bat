@echo off
chcp 65001 >nul
echo ========================================
echo    Flavor Database System Startup
echo ========================================
echo.

:: 检查 Node.js 是否安装
echo [1/6] 检查 Node.js...
node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 错误: 未找到 Node.js，请先安装 Node.js
    echo 下载地址: https://nodejs.org/
    pause
    exit /b 1
)
echo ✅ Node.js 已安装

:: 检查 Python 是否安装
echo [2/6] 检查 Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 错误: 未找到 Python，请先安装 Python
    echo 下载地址: https://www.python.org/
    pause
    exit /b 1
)
echo ✅ Python 已安装

:: 检查后端依赖
echo [3/6] 检查后端依赖...
cd backend
if not exist "node_modules" (
    echo 📦 安装后端依赖...
    npm install
    if errorlevel 1 (
        echo ❌ 后端依赖安装失败
        pause
        exit /b 1
    )
) else (
    echo ✅ 后端依赖已存在
)

:: 创建环境配置文件
echo [4/6] 检查环境配置...
if not exist ".env" (
    echo 📝 创建环境配置文件...
    (
        echo # 数据库配置
        echo DB_HOST=localhost
        echo DB_USER=root
        echo DB_PASSWORD=123456
        echo DB_NAME=flavor_db
        echo.
        echo # 服务器端口
        echo PORT=5000
        echo.
        echo # 环境配置
        echo NODE_ENV=development
    ) > .env
    echo ✅ 环境配置文件已创建
    echo ⚠️  请确保 MySQL 数据库已启动，并更新 .env 文件中的数据库密码
) else (
    echo ✅ 环境配置文件已存在
)

:: 启动后端服务器
echo [5/6] 启动后端服务器...
start "Backend Server" cmd /k "echo 启动后端服务器... && npm run dev"

:: 等待后端启动
timeout /t 3 /nobreak >nul

:: 启动前端服务器
echo [6/6] 启动前端服务器...
cd ../frontend
start "Frontend Server" cmd /k "echo 启动前端服务器... && python -m http.server 8000"

:: 等待前端启动
timeout /t 2 /nobreak >nul
start http://localhost:8000

echo.
echo ========================================
echo ✅ 系统启动完成！
echo ========================================
echo.
echo 🌐 前端地址: http://localhost:8000
echo 🔧 后端地址: http://localhost:5000
echo.
echo 📋 使用说明:
echo    1. 确保 MySQL 数据库已启动
echo    2. 如果数据库连接失败，请检查 backend/.env 文件中的配置
echo    3. 默认数据库密码为 123456，请根据实际情况修改
echo.
echo 🔍 检查后端状态: http://localhost:5000/api/health
echo.
pause 