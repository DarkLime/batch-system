title Batch System
rem Starting...
mode con cols=35 lines=12
echo off
goto main

:main
cls
echo Batch System
echo A new batch project by Cyanic76.
echo.
echo 1. Clock
echo 2. File explorer
echo 3. Calculator
echo 4. Settings
echo 5. Power options
echo 6. Ping tool
echo 7. Close
echo.
choice /C 1234567 /N
set o=%ERRORLEVEL%
if %o% equ 1 goto clock
if %o% equ 2 goto fx
if %o% equ 3 goto calc
if %o% equ 4 goto setup
if %o% equ 5 goto pocli
if %o% equ 6 goto pinger
if %o% equ 7 goto exit1
echo Bad choice.
pause
goto main

:clock
cd files
Clock.bat
goto exit1

:fx
cd files
FileExplorer.bat
goto exit1

:calc
cd files
Calculator.bat
goto exit1

:setup
cd files
Settings.bat
goto exit1

:pocli
cd files
PowerOptions.bat
goto exit1

:pinger
cd files
Ping.bat
goto exit1

:exit1
cls
echo EXITING
rem ID=1
rem Reason=Switching to other program.
exit
