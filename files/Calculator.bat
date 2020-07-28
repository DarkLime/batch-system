title Calculator
rem Starting
echo off
mode con cols=25 lines=8
cls
echo #======Calculator======#
echo : press Ctrl+c to exit :
echo #======================#
echo.

goto main

:main
set /p sum=
set /a ans=%sum%
cls
echo #======Calculator======#
echo : press Ctrl+c to exit :
echo #======================#
echo.
echo %sum% = %ans%
echo.
goto main
