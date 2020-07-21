title Calculator
rem Starting
echo off
mode con cols=35 lines=11
goto main

:main
cls
echo Calculator
echo.
set /p sum=
set /a ans=%sum%
echo.
echo = %ans%
echo.
echo 1- Another calculation
echo 2- Start Menu
choice /c 12 /n
set c=%ERRORLEVEL%
if %c% equ 1 goto main
if %c% equ 2 goto exit1

:exit1
cls
echo Exiting
rem ID=1
rem Reason=Switching to another program
cd ..
BatchSystem.bat
exit
