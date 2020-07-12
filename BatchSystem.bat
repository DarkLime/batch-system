title Batch System
rem Starting...
mode con cols=35 lines=11
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
echo 6. Close
echo.
choice /C 123456 /N
set o=%ERRORLEVEL%
if %o% equ 1 goto clock
if %o% equ 2 goto fx
if %o% equ 3 goto calc
if %o% equ 4 goto setup
if %o% equ 5 goto pocli
if %o% equ 6 goto exit1
goto err1

:clock
cls
echo This does not exist yet.
pause
goto main

:fx
cls
echo This does not exist yet.
pause
goto main

:calc
cls
echo This does not exist yet.
pause
goto main

:setup
cd files
Settings.bat
goto exit1

:pocli
cd files
PowerOptions.bat
goto exit1

:err1
cls
echo ERROR
echo.
echo ID=1
echo Reason=Bad choice. Try again.
echo.
pause
goto main

:exit1
cls
echo EXITING
rem ID=1
rem Reason=Switching to other program.
exit
