title Batch System
rem Starting...
mode con cols=75 lines=12
echo off
goto main

:main
cls
echo Batch System
echo A new batch project by Cyanic76.
echo.
echo #===1===#  #=======2=======#  #======3======#  #===04=====#
echo : Clock :  : File explorer :  : Calculator :   : Settings :
echo #=======#  #===============#  #=============#  # =========#
echo #=======5=======#  #=======6=======#  #==09==#
echo : Power options :  : Network tools :  : Exit :
echo #===============#  #===============#  #======#
echo.
choice /C 123456789 /N
set o=%ERRORLEVEL%
if %o% equ 1 goto clock
if %o% equ 2 goto fx
if %o% equ 3 goto calc
if %o% equ 4 goto setup
if %o% equ 5 goto pocli
if %o% equ 6 goto pinger
if %o% equ 9 goto exit
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

:exit
cls
echo EXITING
rem ID=1
rem Reason=Switching to other program.
exit
