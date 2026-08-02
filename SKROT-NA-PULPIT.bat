@echo off
chcp 65001 >nul
title AWF KIEROWCY - skrot na pulpicie

rem ---------------------------------------------------------------
rem  Tworzy na pulpicie skrot uruchamiajacy program przez Pythona.
rem  Bez pliku exe, wiec Inteligentna kontrola aplikacji nie ma
rem  czego blokowac. Program dziala dokladnie tak samo.
rem ---------------------------------------------------------------

cd /d "%~dp0"

where pythonw >nul 2>&1
if errorlevel 1 (
    echo.
    echo   Nie znaleziono Pythona.
    echo   Pobierz go z python.org, zaznacz "Add Python to PATH"
    echo   i uruchom ten plik ponownie.
    echo.
    pause
    exit /b 1
)

for /f "delims=" %%P in ('where pythonw') do set "PYTHONW=%%P" & goto :mam
:mam

set "SKROT=%USERPROFILE%\Desktop\AWF KIEROWCY.lnk"

powershell -NoProfile -Command ^
  "$s=(New-Object -ComObject WScript.Shell).CreateShortcut('%SKROT%');" ^
  "$s.TargetPath='%PYTHONW%';" ^
  "$s.Arguments='\"%~dp0awf_kierowcy.py\"';" ^
  "$s.WorkingDirectory='%~dp0';" ^
  "$s.IconLocation='%~dp0ikona.ico';" ^
  "$s.Description='AWF KIEROWCY - kontrola wjazdu';" ^
  "$s.Save()"

if exist "%SKROT%" (
    echo.
    echo   Gotowe. Na pulpicie jest skrot: AWF KIEROWCY
    echo   Uruchamia program bez pliku exe, wiec Windows go nie blokuje.
    echo.
) else (
    echo.
    echo   Nie udalo sie utworzyc skrotu.
    echo   Uruchamiaj program przez uruchom.bat z tego folderu.
    echo.
)
pause
