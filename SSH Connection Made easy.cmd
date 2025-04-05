@echo off
chcp 65001 >nul
title SSH Made Easy By Caver1K
:Check
set "filename=%TEMP%\plink.exe"

IF EXIST "%filename%" (
    goto Main
) ELSE (
    cd %TEMP%
    curl -O https://the.earth.li/~sgtatham/putty/0.83/w64/plink.exe
	 cls
)

:Main
cd %TEMP%
echo[
echo[
echo[
echo                                                  ██████  ██████  ██    ██                                            
echo                                                  ██      ██      ██    ██                                            
echo                                                  ██████  ██████  ████████                                            
echo                                                      ██      ██  ██    ██                                            
echo                                                  ██████  ██████  ██    ██             SSH Made Easy.cmd by Kimi Schröder                                           
echo[
echo[
echo[

echo[
echo[
title Select Target/SSH Server
set /p server=Target/SSH Server:
echo[
title Select Username
set /p user=Username:
echo[
title Select Password
set /p pass=Password:
cls
title SSH: Connected
plink.exe -ssh %user%@%server% -pw "%pass%"
if errorlevel 1 (
	echo[
	echo Connection failed with error code %errorlevel%, please try again
	<nul set /p=Press any key to return...
	pause >nul
	cls
	goto main 
)
if errorlevel 2 (
	echo[
	echo Connection was terminated unexpectedly with error code %errorlevel%, please try again
	<nul set /p=Press any key to return...
	pause >nul
	cls
	goto main
)


echo[
echo Connection closed.
timeout /t 3 >nul
cls
goto Main
