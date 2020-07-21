title Clock
rem Clock by Cyanic76!
echo off
cls
mode con cols=25 lines=5
goto loop

:loop
title %time% - Clock
PING localhost -n 2 >NUL
cls
echo #====clock====#
echo : %time% :
echo : %date%  :
echo #=============#
goto loop
