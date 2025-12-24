@echo off
setlocal enabledelayedexpansion
chcp 65001>nul

echo.
echo 🤚  Initializing everything from scratch...

:: Check if winget is available (should be on Windows 10 1709 or later, Windows 11)
where winget >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌  winget not found. Please ensure you're running Windows 10 version 1709 or later, or Windows 11.
    echo ℹ️  You can download the latest from: https://apps.microsoft.com/store/detail/app-installer/9NBLGGH4NNS1
    exit /b 1
) else (
    echo ✅  winget is already available, will use it to setup all the necessary packages
)

:: Install git using winget
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo 👊  Installing git
    winget install --silent --accept-package-agreements --accept-source-agreements -e --id Git.Git
    if !errorlevel! neq 0 (
        echo ❌  Failed to install git. Check if it's already installed and `git` console command is available
        exit /b 1
    )
    echo ✅  git installed successfully
) else (
    echo ✅  git already installed
)

:: Install chezmoi using winget
where chezmoi >nul 2>&1
if %errorlevel% neq 0 (
    echo 👊  Installing chezmoi
    winget install --silent --accept-package-agreements --accept-source-agreements -e --id twpayne.chezmoi
    if !errorlevel! neq 0 (
        echo ❌  Failed to install chezmoi. Check if it's already installed and `chezmoi` console command is available
        exit /b 1
    )
    echo ✅  chezmoi installed successfully
) else (
    echo ✅  chezmoi already installed
)

:: Initialize chezmoi from scratch
echo 🚀  Initializing chezmoi
set "BASH_PATH=%ProgramFiles%\Git\bin\bash.exe"
set "CMD_TO_RUN=chezmoi init --apply --purge https://github.com/pkaramishev/dotfiles.git; exec bash"
mshta vbscript:Execute("CreateObject(""Shell.Application"").ShellExecute ""%SH_PATH%"", ""--login -i -c """"%CMD_TO_RUN%"""""", """", ""runas"", 1:close")

echo ✅  Done. Initialization will proceed in a different window

endlocal
exit
