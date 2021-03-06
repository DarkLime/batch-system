title File Explorer
rem By Cyanic76
echo off
mode con cols=100 lines=40
goto fx

:fx
rem Main
cls
dir
echo.
echo [1- Open file] [ 2- Open folder ] [3- Remove file] [4- Back] [5- Exit]
echo [ 6- Tree view ] [ 7- Remove folder ] [ 8- Create folder ] [ 9- Next ]
choice /c 123456789 /n
set a=%ERRORLEVEL%
if %a% equ 1 goto openfile
if %a% equ 2 goto openfolder
if %a% equ 3 goto delete
if %a% equ 4 goto back
if %a% equ 5 goto exit1
if %a% equ 6 goto treefarm
if %a% equ 7 goto rmfolder
if %a% equ 8 goto mkfolder
if %a% equ 9 goto fx2
echo Bad choice!
pause
goto fx

:fx2
rem Main secondary
cls
dir
echo.
echo [1- Switch to other partition] [2- Rename a file] [3- Next]
choice /c 123 /n
set b=%ERRORLEVEL%
if %b% equ 1 goto letters
if %b% equ 2 goto rename
if %b% equ 3 goto fx
echo Bad choice!
pause
goto fx2

:exit1
echo Exiting...
exit

:openfile
cls
dir
echo.
set /p file="File name: "
cls
echo Close the file to continue.
%file%
goto fx

:openfolder
cls
dir
echo.
set /p folder="Folder name: "
cd %folder%
goto fx

:delete
cls
dir
echo.
set /p del="File to delete: "
del /f /a %del%
goto fx

:back
cd ..
goto fx

:treefarm
echo.
echo Generating tree view...
tree > C:\Users\%USERNAME%\Desktop\tree.txt
echo Done!
echo Close tree.txt to continue.
C:\Users\%USERNAME%\Desktop\tree.txt
del /f /a C:\Users\%USERNAME%\Desktop\tree.txt
goto fx

:rmfolder
cls
dir
echo.
set /p folder="Folder to delete: "
rmdir %folder%
goto fx

:mkfolder
cls
dir
echo.
set /p folder="Folder name: "
mkdir %folder%
goto fx

:letters
cls
echo Choose one of the available drives.
echo.
fsutil fsinfo drives
echo.
set /p drive="Letter: "
echo.
echo Switching to %drive%:...
%drive%:
goto fx

:rename
cls
dir
echo.
set /p file1="File to rename: "
echo.
set /p newname="New name for %file1%: "
ren file1 newname
goto fx2
