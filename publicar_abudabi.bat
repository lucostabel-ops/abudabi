@echo off
setlocal
cd /d "%~dp0"

where git >nul 2>nul
if %errorlevel%==0 (
  set "GIT=git"
) else (
  set "GIT=C:\Program Files\Git\cmd\git.exe"
)

if not exist "control_diario_abudabi.html" (
  echo No se encontro control_diario_abudabi.html en esta carpeta.
  pause
  exit /b 1
)

copy /Y "control_diario_abudabi.html" "index.html" >nul

echo Revisando cambios...
"%GIT%" status --short

echo.
"%GIT%" diff --quiet --exit-code
if %errorlevel%==0 (
  "%GIT%" diff --cached --quiet --exit-code
  if %errorlevel%==0 (
    echo No hay cambios nuevos para publicar.
    pause
    exit /b 0
  )
)

"%GIT%" add index.html control_diario_abudabi_datos.json README.md netlify.toml .gitignore publicar_abudabi.bat

for /f "tokens=1-3 delims=/ " %%a in ('date /t') do set TODAY=%%a-%%b-%%c
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set NOW=%%a-%%b

"%GIT%" commit -m "Actualizar Abu Dhabi %TODAY% %NOW%"
if errorlevel 1 (
  echo No se pudo crear el commit.
  pause
  exit /b 1
)

"%GIT%" push
if errorlevel 1 (
  echo No se pudo subir a GitHub. Revisar conexion o login de GitHub.
  pause
  exit /b 1
)

echo.
echo Listo. GitHub fue actualizado y Netlify publicara automaticamente en unos segundos.
pause

