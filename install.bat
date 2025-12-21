@echo off
setlocal enabledelayedexpansion

echo.
echo "🤚  Initializing everything from scratch..."

:: Check if winget is available (should be on Windows 10 1709 or later, Windows 11)
where winget >nul 2>&1
if %errorlevel% neq 0 (
    echo "❌  winget not found. Please ensure you're running Windows 10 version 1709 or later, or Windows 11."
    echo "   You can download the latest from: https://apps.microsoft.com/store/detail/app-installer/9NBLGGH4NNS1"
    exit /b 1
) else (
    echo "✅  winget is already available, will use it to setup all the necessary packages"
)

:: Install git using winget
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo "👊  Installing git"
    winget install -e --id Git.Git
    if !errorlevel! neq 0 (
        echo "❌  Failed to install git"
        exit /b 1
    )
    echo "✅  git installed successfully"
) else (
    echo "✅  git already installed"
)

:: Install chezmoi using winget
where chezmoi >nul 2>&1
if %errorlevel% neq 0 (
    echo "👊  Installing chezmoi"
    winget install -e --id twpayne.chezmoi
    if !errorlevel! neq 0 (
        echo "❌  Failed to install chezmoi"
        exit /b 1
    )
    echo "✅  chezmoi installed successfully"
) else (
    echo "✅  chezmoi already installed"
)

:: Check if chezmoi is already initialized
if exist "%USERPROFILE%\.local\share\chezmoi\.git" (
  echo "🚸  chezmoi already initialized"
  echo "    Reinitialize with: 'chezmoi init https://github.com/pkaramishev/dotfiles.git'"
) else (
  echo "🚀  Initializing chezmoi"
  chezmoi init https://github.com/pkaramishev/dotfiles.git
)

echo.
echo "✅  Done."

echo "⏯️  Next steps: "
echo "1️⃣  TBD"

endlocal
