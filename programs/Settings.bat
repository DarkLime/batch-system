title Windows Settings CLI - Checking for administrator permission...
rem Made by Cyanic76
mode con cols=50 lines=14
@echo off
goto check

:check
openfiles > NULL 2>&1
if NOT %ERRORLEVEL% EQU 0 goto afa
goto menu

:afa
cls
del /f /a NULL
title Windows Settings CLI
echo.
echo.
echo.
echo.
echo         Settings
echo.
echo.
echo.       Please wait
powershell -Command "Start-Process Settings.bat -Verb RunAs"
goto check2

:check2
openfiles > NULL 2>&1
if NOT %ERRORLEVEL% EQU 0 goto err1
goto menu

:err1
cls
openfiles > NULL 2>&1
if NOT %ERRORLEVEL% EQU 0 goto menu
title Windows Settings - Running as normal user.
echo Windows 10
echo Settings CLI
echo.
echo You did not started the program with
echo elevated permission.
echo.
echo 1- Ask for elevated permission
echo 2- Close
echo 3- Back
echo.
choice /C 123 /N
set o=%ERRORLEVEL%
if %o% equ 1 goto afa
if %o% equ 2 goto exit
if %o% equ 3 goto back_to_main

:back_to_main
cd ..
BatchSystem.bat
exit

:menu
openfiles > NULL 2>&1
if NOT %ERRORLEVEL% EQU 0 exit
del /f /a NULL
title Windows Settings
cls
echo Windows 10
echo Settings CLI
echo.
echo 1. Network
echo.
choice /C 1 /N
set option=%ERRORLEVEL%
if %option% equ 1 goto network
echo Choice is not valid.
pause
goto menu

:network
title Network - Windows Settings CLI
cls
echo Network settings
echo.
echo 1- Connect to a Wireless Network
echo 2- Network Saved Connections manager
echo 3- Info about WiFi driver
echo 4- WiFi properties
echo 5- WiFi hotspot settings
echo 6- Generate a report
echo 7- Back
choice /C 123456 /N
set opt=%ERRORLEVEL%
if %opt% equ 1 goto network_connect
if %opt% equ 2 goto network_nscm
if %opt% equ 3 goto network_wifidriver
if %opt% equ 4 goto network_adapter
if %opt% equ 5 goto network_hotspotset
if %opt% equ 6 goto network_report
if %opt% equ 7 goto menu
echo Choice is not valid.
pause
goto network

:network_connect
cls
echo Let's get you connected.
set /p name="Wireless network name (SSID)? "
cls
echo Connecting to %name%...
netsh wlan connect name="%name%"
pause
goto menu

:network_nscm
cls
echo Network settings/NSCM
echo.
echo 1. Reveal a password
echo 2. Remove a saved network
echo 3. Get a list
echo 4. Back
echo.
choice /c 1234 /n
set nscm_choice=%ERRORLEVEL%
if %nscm_choice% equ 1 goto network_nscm_passwords
if %nscm_choice% equ 2 goto network_nscm_forget
if %nscm_choice% equ 3 goto network_nscm_list
if %nscm_choice% equ 4 goto network
echo Choice not valid
pause
goto network_nscm

:network_nscm_passwords
cls
echo Reveal a password
echo.
echo If any security breach occurs,
echo the developer declines any
echo responsability.
echo.
echo Let's do that.
set /p wifiname="What's the wireless network name? "
cls
echo Look below.
netsh wlan show profile name="%wifiname%" key=clear
pause
goto network_nscm

:network_nscm_forget
cls
echo Forget a saved connection
echo.
echo Are you sure to do that?
echo 1-Yes 2-No
choice /c 12 /n
set nscm_forget_choice=%ERRORLEVEL%
if %nscm_forget_choice% equ 1 goto network_nscm_forget_main
if %nscm_forget_choice% equ 2 goto network_nscm
echo Choice not valid
pause
goto network_nscm_forget

:network_nscm_forget
cls
echo Forget a saved connection
echo.
set /p wifiname="What's the wireless network name? "
cls
echo Look below.
netsh wlan delete profile name="%wifiname%"
pause
goto network_nscm

:network_nscm_list
cls
echo Here's a list of saved networks.
echo.
netsh wlan show profiles
pause
goto network_nscm

:network_wifidriver
cls
echo About Driver
echo.
netsh wlan show drivers
echo.
echo 1 of 2
pause
netsh wlan show wirelesscapabilities
echo.
echo 2 of 2
pause
goto network

:network_adapter
cls
echo Interface
echo.
netsh wlan show interfaces
pause
goto network

:network_hotspotset
cls
echo Hotspot settings
echo.
echo 1- Edit name
echo 2- Edit password
choice /c 12 /n
set network_hotspotset_value1=%ERRORLEVEL%
if %network_hotspotset_value1% equ 1 goto network_hotspotset_name
if %network_hotspotset_value1% equ 2 goto network_hotspotset_pw
echo Choice is not valid.
pause
goto network_hotspotset

:network_hotspotset_name
cls
echo Hotspot settings
echo.
set /p network_hotspotset_new_name="What should be the SSID? "
cls
netsh wlan set hostednetwork mode=allow ssid="%network_hotspotset_new_name%"
pause
goto network_hotspotset

:network_hotspotset_pw
cls
echo Hotspot settings
echo.
set /p network_hotspotset_new_pw="What should be the password? "
cls
netsh wlan set hostednetwork mode=allow ssid="%network_hotspotset_new_pw%"
pause
goto network_hotspotset

:network_report
cls
netsh wlan show wlanreport
C:\ProgramData\Microsoft\Windows\WLANReport\WLAN-report-latest.html
echo Done!
pause
goto network
