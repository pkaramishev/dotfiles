#!/bin/bash

echo ""
echo "🤚  Initializing everything from scratch..."

# Install Homebrew
command -v brew >/dev/null 2>&1 || \
  (echo '🍺  Installing Homebrew' && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")

# Install XCode tools for Terminal
if [ ! -f /Library/Developer/CommandLineTools/usr/bin/git ]; then
  (echo '💰  Installing XCode tools for Terminal' && xcode-select --install)
fi

# Install chezmoi
command -v chezmoi >/dev/null 2>&1 || \
  (echo '👊  Installing chezmoi' && brew install chezmoi)

if [ -d "$HOME/.local/share/chezmoi/.git" ]; then
  echo "🚸  chezmoi already initialized"
  echo "    Reinitialize with: 'chezmoi init https://github.com/pkaramishev/dotfiles.git'"
else
  echo "🚀  Initializing chezmoi"
  chezmoi init https://github.com/pkaramishev/dotfiles.git
fi

echo ""
echo "✅  Done."

echo "⏯️  Next steps: "
echo "1️⃣  Go to System Preferences > Privacy & Security and enable access to camera, screen and microphone for all communication apps"
echo "2️⃣  Setup menu items manually (Clock, Calendar, Zoom, Weather)"