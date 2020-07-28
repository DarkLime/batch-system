title Windows Settings CLI - Checking for administrator permission...
rem Made by Cyanic76
mode con cols=50 lines=15
@echo off
goto check

:check
openfiles > NULL 2>&1
set devices_check=1
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
echo             Settings
echo.
echo.
echo.          Please  wait
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
del /f /a NULL
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
echo 2. BatchSystem
echo 3. About Windows
echo 4. Time and region
echo 5. Devices
echo 6. Back
echo.
choice /C 123456 /N
set option=%ERRORLEVEL%
if %option% equ 1 goto network
if %option% equ 2 goto bs
if %option% equ 3 goto windows
if %option% equ 4 goto timeregion
if %option% equ 5 goto devices
if %option% equ 6 goto exit1
echo Choice is not valid.
pause
goto menu

:exit1
cls
echo Exiting...
rem ID=1
rem Reason=Switching to another program
cd ..
BatchSystem.bat
exit

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
choice /C 1234567 /N
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
netsh wlan connect name="BatchSys_%name%" SSID="%name%"
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
echo 3- Back
choice /c 123 /n
set network_hotspotset_value1=%ERRORLEVEL%
if %network_hotspotset_value1% equ 1 goto network_hotspotset_name
if %network_hotspotset_value1% equ 2 goto network_hotspotset_pw
if %network_hotspotset_value1% equ 3 goto network
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

:bs
cls
echo BatchSystem settings
title BatchSystem settings
echo.
echo 1- About
echo 2- Developers
echo 3- Back
choice /c 123 /n
set bs_choice=%ERRORLEVEL%
if %bs_choice% equ 1 goto bs_about
if %bs_choice% equ 2 goto bs_devs
if %bs_choice% equ 3 goto menu
echo Choice not valid.
pause
goto bs

:bs_about
cls
echo About
echo.
echo   BATCH SYSTEM
echo   by  Cyanic76
echo.
echo Branch:    master
echo Version:   prerelease
echo.
echo Licensed to:
whoami
echo.
pause
goto bs

:bs_devs
cls
echo BATCH SYSTEM
echo.
echo Contribute on GitHub
echo https://github.com/Cyanic76/batch-system
echo.
echo License:
echo GNU GPL v3
echo.
echo Software type:
echo OSS - Open Source Software
echo.
pause
goto bs

:windows
cls
echo ABOUT
ver
echo.
echo 1- RAM Information
echo 2- OS Information
echo 3- User Information
echo 4- BIOS Information
echo 5- Manufacturer Information
echo 6- Processor Information
echo 7- Check Disk
echo 8- Back
echo.
choice /c 12345678 /n
set win=%ERRORLEVEL%
if %win% equ 1 goto windows_ram
if %win% equ 2 goto windows_os
if %win% equ 3 goto windows_users
if %win% equ 4 goto windows_bios
if %win% equ 5 goto windows_manufacturer
if %win% equ 6 goto windows_cpu
if %win% equ 7 goto windows_cd
if %win% equ 8 goto menu
echo Choice is not valid.
pause
goto windows

:windows_ram
cls
echo ABOUT/RAM
echo.
systeminfo | findstr /C:"Total Physical Memory"
systeminfo | findstr /C:"Available Physical Memory"
echo.
echo 1- Complete info
echo 2- Simplified info
echo 3- Back
choice /c 123 /n
set ram_choice=%ERRORLEVEL%
if %ram_choice% equ 1 goto windows_ram_complete
if %ram_choice% equ 2 goto windows_ram_simplified
if %ram_choice% equ 3 goto windows
echo Choice is not valid.
pause
goto windows

:windows_ram_complete
cls
mode con cols=80 lines=14
echo Look below.
echo The capacity is in bytes.
echo.
wmic MEMORYCHIP get BankLabel, DeviceLocator, MemoryType, TypeDetail, Capacity, Speed
pause
mode con cols=50 lines=14
goto windows_ram

:windows_ram_simplified
cls
mode con cols=80 lines=14
echo Look below.
echo The capacity is in bytes.
echo.
wmic MEMORYCHIP get BankLabel,Capacity
pause
mode con cols=50 lines=14
goto windows_ram

:windows_os
cls
mode con cols=90 lines=14
echo ABOUT/Operating System
echo.
systeminfo | findstr /C:"OS Name"
systeminfo | findstr /C:"OS Version"
systeminfo | findstr /C:"OS Manufacturer"
systeminfo | findstr /C:"OS Configuration"
systeminfo | findstr /C:"OS Build Type"
systeminfo | findstr /C:"Product ID"
echo.
pause
mode con cols=50 lines=14
goto windows

:windows_users
cls
echo About/Windows User
echo.
systeminfo | findstr /C:"Registered Owner"
systeminfo | findstr /C:"Registered Organization"
systeminfo | findstr /C:"Host Name"
systeminfo | findstr /C:"Domain"
echo.
pause
goto windows

:windows_bios
cls
echo About/BIOS
echo.
systeminfo | findstr /C:"BIOS Version"
systeminfo | findstr /C:"Boot Device"
systeminfo | findstr /C:"System Boot Time"
echo.
pause
goto windows

:windows_manufacturer
cls
echo About/Manufacturer info
echo.
systeminfo | findstr /C:"Original Install Date"
systeminfo | findstr /C:"System Model"
systeminfo | findstr /C:"System Manufacturer"
systeminfo | findstr /C:"System Type"
echo.
pause
goto windows

:windows_cpu
cls
mode con cols=55 lines=14
echo About/Processor (CPU)
echo.
systeminfo | findstr /C:"System Type"
systeminfo | findstr /C:"Processor(s)"
echo.
pause
mode con cols=50 lines=14
goto windows

:windows_cd
cls
echo About/Checking disk
echo.
echo Start checking the disk?
pause
cls
echo Generating report, please wait...
echo.
echo This step can take few minutes.
chkdsk > log.txt
goto windows_cd_done

:windows_cd_done
cls
echo About/Checking disk
echo.
echo Report successfully generated.
echo.
echo 1- Open report
echo 2- Continue
choice /c 12 /n
set windows_cd_choice=%ERRORLEVEL%
if %windows_cd_choice% equ 1 goto windows_cd_report
if %windows_cd_choice% equ 2 goto windows
pause
goto windows

:windows_cd_report
cls
echo About/Checking disk
echo.
echo Report opened. Available at log.txt.
echo Close the report to continue.
log.txt
goto windows_cd_done

:timeregion
cls
echo Time and region
echo.
echo 1- Time settings
echo 2- Date settings
echo 3- View time/date
echo 4- Region info
echo 5- Back
choice /c 12345 /n
set tr_choice=%ERRORLEVEL%
if %tr_choice% equ 1 goto timeregion_timeset
if %tr_choice% equ 2 goto timeregion_dateset
if %tr_choice% equ 3 goto timeregion_current
if %tr_choice% equ 4 goto timeregion_region
if %tr_choice% equ 5 goto menu
echo Choice is not valid.
pause
goto timeregion

:timeregion_timeset
cls
echo Time and region/Set time
echo.
echo Let the new time empty will
echo not change it.
echo.
time
cls
echo We're done setting your computer
echo time!
echo.
echo It is currently %time%.
pause
goto timeregion

:timeregion_dateset
cls
echo Time and region/Set date
echo.
echo Let the new date empty will
echo not change it.
echo.
date
cls
echo We're done setting your computer
echo date!
echo.
echo Today is %date%.
pause
goto timeregion

:timeregion_current
cls
echo Time and region/Current time
echo.
echo %time%
echo %date%
echo.
pause
goto timeregion

:timeregion_region
cls
mode con cols=80 lines=14
echo Time and region/Region info
echo.
systeminfo | findstr /C:"System Locale"
systeminfo | findstr /C:"Input Locale"
systeminfo | findstr /C:"Time Zone"
echo.
pause
mode con cols=50 lines=14
goto timeregion

:devices
cls
if %devices_check% equ 1 pause
cls
set devices_check=0
echo Devices
echo.
echo 1- View printers
echo 2- Change computer name
echo 3- Volume Manager
echo 4- Back
choice /c 1234 /n
set devices_choice=%ERRORLEVEL%
if %devices_choice% equ 1 goto devices_printers_view
if %devices_choice% equ 2 goto devices_computer_namechange
if %devices_choice% equ 3 goto devices_vm
if %devices_choice% equ 4 goto menu

:devices_printers_view
mode con cols=80 lines=20
cls
echo Devices/Printers
echo.
echo All installed printers on this computer.
echo.
powershell Get-Printer
pause
mode con cols=50 lines=14
goto devices

:devices_computer_namechange
cls
echo Devices/Edit computer name
echo.
echo Current computer name:
hostname
echo.
echo 1- Edit
echo 2- Back
choice /c 12 /n
set devices_computer_namechange_choice=%ERRORLEVEL%
if %devices_computer_namechange_choice% equ 1 goto devices_computer_namechange_ok
if %devices_computer_namechange_choice% equ 2 goto devices

:devices_computer_namechange_ok
cls
echo Devices/Edit computer name
echo.
echo Current computer name:
hostname
echo.
echo Provide the new name:
set /p devices_computer_namechange_name=""
echo Devices/Edit computer name
echo.
echo Look below.
echo.
powershell Rename-Computer -NewName "%devices_computer_namechange_name%"
pause
goto devices_computer_namechange

:devices_vm
cls
echo Devices/Partition manager
echo.
echo 1- View partition list
echo 2- Create a partition
echo 3- Back
choice /c 123 /n
set devices_vm_choice=%ERRORLEVEL%
if %devices_vm_choice% equ 1 goto devices_vm_list
if %devices_vm_choice% equ 2 goto devices_vm_add
if %devices_vm_choice% equ 3 goto devices

:devices_vm_list
echo Devices/Partition manager
echo.
echo List of partitions
fsutil fsinfo drives
echo.
pause
goto devices_vm

:devices_vm_add
echo Create a new partition
echo.
echo Will be soon available.
pause
goto devices_vm
