title Network tools
rem Starting
mode con cols=90 lines=30
echo off
goto pre

:pre
cls
echo Network tools
echo.
echo 1- Ping tool
echo 2- Tracert
echo 3- Exit
choice /c 123 /n
set prer=%ERRORLEVEL%
if %prer% equ 1 goto main
if %prer% equ 2 goto trace
if %prer% equ 3 goto exit

:main
cls
echo Ping tool
echo.
echo Ping an address to test if it's online.
echo.
echo Let's start.
set /p ip="What's the address to ping? "
cls
echo Ping tool.
echo.
echo The address is %ip%.
set /p reqs="How many request should be sent? "
cls
echo Ping tool.
echo.
echo %reqs% requests will be sent.
echo The limit for the size is 65,527.
set /p size="Size of requests, in bytes? "
goto pinger

:pinger
cls
echo Ping tool.
echo.
echo Provided settings:
echo Address: %ip%
echo Requests: %reqs%
echo Size of each request: %size% bytes
echo.
echo When you're ready,
pause
cls
echo Ping tool.
echo.
echo Press CTRL and C to interrupt.
ping "%ip%"
pause
goto ended

:ended
cls
echo Ping tool.
echo.
echo Ended!
echo.
echo 1- Start again with same settings
echo 2- Start again
echo 3- Back to start menu
choice /c 123 /n
set end=%ERRORLEVEL%
if %end% equ 1 goto main
if %end% equ 2 goto pinger
if %end% equ 3 goto pre
echo Bad choice.
pause
goto ended

:exit
echo Exiting...
cd ..
BatchSystem.bat
exit

:trace
cls
echo Trace route tool.
echo.
set /p ip="IP? "
cls
tracert %ip%
pause
goto pre
