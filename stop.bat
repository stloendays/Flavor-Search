@echo off
chcp 65001 >nul
echo ========================================
echo    Flavor Database - Stop Services
echo ========================================
echo.

echo [1/2] 停止后端服务器...
taskkill /f /im node.exe >nul 2>&1
if errorlevel 1 (
    echo ✅ 后端服务器已停止或未运行
) else (
    echo ✅ 后端服务器已停止
)

echo [2/2] 停止前端服务器...
taskkill /f /im python.exe >nul 2>&1
if errorlevel 1 (
    echo ✅ 前端服务器已停止或未运行
) else (
    echo ✅ 前端服务器已停止
)

echo.
echo ========================================
echo ✅ 所有服务已停止！
echo ========================================
echo.
echo 💡 提示: 如需重新启动，请运行 quick-start.bat
echo.
pause 