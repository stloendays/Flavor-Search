@echo off
echo ========================================
echo    Flavor Database - Simple Start
echo ========================================
echo.

echo [1/4] Checking Node.js...
node --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js not found
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)
echo OK: Node.js found

echo [2/4] Checking Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python not found
    echo Please install Python from https://www.python.org/
    pause
    exit /b 1
)
echo OK: Python found

echo [3/4] Starting Backend Server...
cd backend
if not exist ".env" (
    echo Creating .env file...
    (
        echo # Database Configuration
        echo DB_HOST=localhost
        echo DB_USER=root
        echo DB_PASSWORD=123456
        echo DB_NAME=flavor_db
        echo.
        echo # Server Port
        echo PORT=5000
        echo.
        echo # Environment
        echo NODE_ENV=development
    ) > .env
)
start "Backend Server" cmd /k "npm run dev"

echo [4/4] Starting Frontend Server...
cd ../frontend
start "Frontend Server" cmd /k "python -m http.server 8000"

echo.
echo ========================================
echo SUCCESS: System started!
echo ========================================
echo.
echo Frontend: http://localhost:8000
echo Backend:  http://localhost:5000
echo.
echo Note: Make sure MySQL is running
echo.
pause 