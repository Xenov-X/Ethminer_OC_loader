@ECHO OFF

SET ABurner="C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe"
SET EthMiner="C:\Mining\ethminer-0.19.0-17+commit.23d537a0-cuda11.1.0-windows-amd64\bin\ethminer.exe"


:B
SET MyProcess=ethminer.exe
Echo.
Echo.
Echo You can quit during this timer and mining OC is not applied
timeout /t 60
ECHO Checking if "%MyProcess%" is running
TASKLIST | FINDSTR /I "%MyProcess%"
IF ERRORLEVEL 1 (GOTO :StartScripts) ELSE (ECHO "%MyProcess%" is running)
GOTO :B 

:StartScripts 
::: //-- Put in the full path to the batch scripts to call
::: //-- Be sure the security context this process runs as has access to execute the below called batch scripts

echo Loading OC settings	-	%time% %date%
taskkill /f /im MSIAfterburner.exe >nul 2>&1
START "" %ABurner% -Profile5 -s
timeout /t 5 /nobreak >nul
taskkill /f /im MSIAfterburner.exe >nul 2>&1
echo Loaded OC settings


echo.
echo Starting Miner		-	%time% %date%
START "EthMiner" %EthMiner% -P stratum1+ssl://0xb044F40c3b8E3c98aF611DB3a91b57eD33300650.Desktop1@eu1.ethermine.org:5555 | more

echo.
echo Removing OC settings	-	%time% %date%
taskkill /f /im MSIAfterburner.exe >nul 2>&1
START "" %ABurner% -Profile4 -s
timeout /t 5 /nobreak >nul
taskkill /f /im MSIAfterburner.exe >nul 2>&1
echo Removed OC settings

GOTO :B 
