@echo off
set php="%CD%\php\php.exe"
if not exist php (
		echo DOWNLOADING CAMPHISH FILES...

                mkdir %php%\.. >nul 2>&1
		echo.
		echo Downloading php...
		echo.
		if %PROCESSOR_ARCHITECTURE%==AMD64 powershell -command "Invoke-WebRequest 'https://windows.php.net/downloads/releases/archives/php-8.0.9-nts-Win32-vs16-x64.zip' -Outfile '%php%.zip'"
		if %PROCESSOR_ARCHITECTURE%==x86 powershell -command "Invoke-WebRequest 'https://windows.php.net/downloads/releases/archives/php-8.0.9-nts-Win32-vs16-x86.zip' -Outfile '%php%.zip'"


		7za.exe x -y -o%php%\.. %php%.zip
		del %php%.zip
		del 7za.exe
		echo Downloading cloudflare...
		echo.
		if %PROCESSOR_ARCHITECTURE%==AMD64 powershell -command "Invoke-WebRequest 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-windows-amd64.exe' -Outfile 'cloudflare.exe'"
		if %PROCESSOR_ARCHITECTURE%==x86 powershell -command "Invoke-WebRequest 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-windows-amd64.exe' -Outfile 'cloudflare.exe'"
		cls
		echo DOWNLOAD COMPLETED! 
		(goto) 2>nul & del "%~f0" & cmd /c exit /b 10
)
