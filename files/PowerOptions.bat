title Power Options CLI - Checking for administrator permission...
mode con cols=40 lines=11
rem Made by Cyanic76
@echo off
goto check

:check
openfiles > NULL 2>&1
if NOT %ERRORLEVEL% EQU 0 goto afa
goto menu

:afa
title Power Options CLI - Waiting for administrator permission...
powershell -Command "Start-Process PowerOptions.bat -Verb RunAs"
goto check2

:check2
openfiles > NULL 2>&1
if NOT %ERRORLEVEL% EQU 0 goto err1
goto menu

:err1
cls
openfiles > NULL 2>&1
if NOT %ERRORLEVEL% EQU 0 goto exit
title Power Options CLI - Running as normal user.
echo Windows 10
echo Power Options CLI
echo.
echo You did not started the program with
echo elevated permission.
echo.
echo 1- Ask for elevated permission
echo 2- Close
echo.
choice /C 12 /N
set o=%ERRORLEVEL%
if %o% equ 1 goto afa
if %o% equ 2 goto exit

:menu
title Power Options CLI
cls
echo Windows 10
echo Power Options CLI
echo.
echo 1- Shut down
echo 2- Shut down 2.0 [BETA]
echo 3- Sleep
echo 4- Restart
echo 5- Lock
echo 6- About
echo 7- Close
echo.
choice /C 1234567 /N
set option=%ERRORLEVEL%
if %option% equ 1 goto sd
if %option% equ 2 goto sd20
if %option% equ 3 goto sleep
if %option% equ 4 goto reboot
if %option% equ 5 goto lk
if %option% equ 6 goto about
if %option% equ 7 goto exit2
echo Choice is not valid.
pause
goto menu

:sd
cls
echo Are you sure to shut this PC down?
echo Any unsaved work will be deleted.
echo Other users can be logged in and will lose their unsaved work.
echo.
echo 1- Yes
echo 2- Back
choice /C 12 /N
set shutdownvalidation=%ERRORLEVEL%
if %shutdownvalidation% equ 1 goto sd2
if %shutdownvalidation% equ 2 goto menu

:sd2
echo Shutting down...
shutdown /s /f /t 0
goto exit

:sd20
cls
echo Waiting for user to slide to shut down...
C:\Windows\System32\SlideToShutDown.exe
goto exit

:sleep
cls
echo Are you sure to make this PC go hibernating?
echo Any unsaved work will be deleted.
echo Other users can be logged in and will lose their unsaved work.
echo.
echo 1- Yes
echo 2- Back
choice /C 12 /N
set shutdownvalidation=%ERRORLEVEL%
if %shutdownvalidation% equ 1 goto sleep2
if %shutdownvalidation% equ 2 goto menu

:sleep2
echo Hibernating...
shutdown /h /f /t 0
goto exit

:reboot
cls
echo Are you sure to restart this PC?
echo Any unsaved work will be deleted.
echo Other users can be logged in and will lose their unsaved work.
echo.
echo 1- Yes
echo 2- Back
choice /C 12 /N
set shutdownvalidation=%ERRORLEVEL%
if %shutdownvalidation% equ 1 goto restart2
if %shutdownvalidation% equ 2 goto menu

:restart2
echo Shutting down...
shutdown /r /f /t 0
goto exit

:lk
cls
echo Locking...
rundll32.exe user32.dll,LockWorkStation
goto exit

:about
cls
echo WIN10 POWER OPTIONS CLI
echo Power options made the easy way.
echo.
echo By Cyanic76 - is.gd/cyanic
echo.
pause
goto menu

:exit
echo Exiting
echo Reason=Exiting
del /f /a NULL
exit

:exit2
echo Exiting
echo Reason=Going back to Main
del /f /a NULL
cd ..
BatchSystem.bat
exit
