@echo off

@chcp 1250

attr 0F

:menu

cls

echo ------------------------

echo 	MENU

echo ------------------------

echo.

echo 1) Uruchom program

echo 2) Informacje 

echo 3) Backup 

echo 4) Koniec

echo.

set /p opcja=wybierz i wpisz odpowiedni nr, np: 1:

if %opcja%==1 goto uruchom

if %opcja%==2 goto info

if %opcja%==3 goto backup

if %opcja%==4 exit

goto error



:uruchom

cls 
for %%f in (Input/*.txt) do main.py Input/%%f Output/%%f
for %%f in (Input/*.txt) do HTML.py Input/%%f Output/%%f HTML/%%f




goto backup



:backup

cls

if not exist Backup md Backup

set datestr=%date:~-4,4%.%date:~-7,2%.%date:~-10,2%_%time:~0,2%.%time:~3,2%.%time:~6,2%

md backup/%datestr%

robocopy ..\projekt .\backup/%datestr% /S /XD backup

cls

echo stworzono kopie plikow w folderze backup/%datestr%

pause >Nul

cd HTML
start promien.html

goto menu



:error

echo wpisano nieprawid³owe dane, wybierz sposrod: {1, 2, 3 ,4}

pause >Nul

goto menu