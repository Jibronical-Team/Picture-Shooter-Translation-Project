@echo off
setlocal

set "SOURCE_DIR=src"

where msgfmt >nul 2>nul
if %errorlevel% neq 0 (
	echo ERROR: msgfmt not found.
	echo Make sure that gettext is added into PATH
	pause
	exit /b
)

if not exist "%SOURCE_DIR%" (
    echo ERROR "%SOURCE_DIR%" not found
    pause
    exit /b
)

echo Searching for .po files in "%SOURCE_DIR%"...

for %%f in ("%SOURCE_DIR%\*.po") do (
    echo Converting: %%~nxf -^> %%~nf.mo
    msgfmt "%%f" -o "%~dp0%%~nf.mo"
)


echo.
echo Done!
pause