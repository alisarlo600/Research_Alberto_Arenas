@echo off
REM ===================================================================
REM  update_github.bat
REM  Sube automaticamente cualquier cambio en esta carpeta a GitHub.
REM  Guarda este archivo DENTRO de C:\Tesis\Research_Alberto_Arenas
REM  y hazle doble clic cada vez que quieras subir cambios.
REM ===================================================================

cd /d "%~dp0"

echo.
echo ============================================
echo   Revisando cambios en el repositorio...
echo ============================================
git status

echo.
set /p MSG="Escribe un mensaje corto describiendo el cambio (Enter = mensaje automatico): "

if "%MSG%"=="" (
    for /f "tokens=1-4 delims=/ " %%a in ('date /t') do set DATESTR=%%a-%%b-%%c
    for /f "tokens=1-2 delims=: " %%a in ('time /t') do set TIMESTR=%%a-%%b
    set MSG=Update %DATESTR% %TIMESTR%
)

echo.
echo ============================================
echo   Preparando archivos (git add)...
echo ============================================
git add .

echo.
echo ============================================
echo   Guardando cambios (git commit)...
echo ============================================
git commit -m "%MSG%"

if errorlevel 1 (
    echo.
    echo No habia cambios nuevos que subir, o el commit fallo.
    echo Revisa el mensaje de arriba.
    pause
    exit /b
)

echo.
echo ============================================
echo   Subiendo a GitHub (git push)...
echo ============================================
git push origin main

echo.
echo ============================================
echo   Listo. Revisa tu repositorio en GitHub.
echo ============================================
pause
