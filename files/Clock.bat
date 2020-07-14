title Clock
rem Clock by Cyanic76!
echo off
cls
mode con cols=30 lines=3
goto loop

:loop
title %time% - Clock
cls
echo %time%
echo %date%
ping -n 2 0.0.0.0 >nul
goto loop
