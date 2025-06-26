@echo off
echo ========================================
echo    Database Connection Check
echo ========================================
echo.

echo [1/3] Checking MySQL...
mysql --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: MySQL not found
    echo Please install MySQL or XAMPP
    pause
    exit /b 1
)
echo OK: MySQL found

echo [2/3] Testing database connection...
cd backend
if exist ".env" (
    echo Reading .env file...
    for /f "tokens=2 delims==" %%a in ('findstr "DB_PASSWORD" .env') do set DB_PASS=%%a
    for /f "tokens=2 delims==" %%a in ('findstr "DB_NAME" .env') do set DB_NAME=%%a
    
    if "%DB_PASS%"=="" set DB_PASS=123456
    if "%DB_NAME%"=="" set DB_NAME=flavor_db
    
    echo Testing connection with password: %DB_PASS%
    mysql -u root -p%DB_PASS% -e "USE %DB_NAME%; SELECT 1;" >nul 2>&1
    if errorlevel 1 (
        echo ERROR: Database connection failed
        echo Please check:
        echo 1. MySQL service is running
        echo 2. Password is correct
        echo 3. Database exists
        echo.
        echo Try running: setup-database.bat
    ) else (
        echo OK: Database connection successful
    )
) else (
    echo ERROR: .env file not found
    echo Please run: simple-start.bat
)

echo [3/3] Checking backend health...
cd ..
timeout /t 2 /nobreak >nul
curl -s http://localhost:5000/api/health >nul 2>&1
if errorlevel 1 (
    echo ERROR: Backend not responding
    echo Please start the backend server first
) else (
    echo OK: Backend is running
)

echo.
echo ========================================
echo Check completed!
echo ========================================
echo.
pause 