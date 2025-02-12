#!/bin/bash

echo ""
echo "🤚  Initializing everything from scratch..."

# Ask user to generate Github access token
echo "🤚  First of all, go to https://github.com/settings/tokens and generate new access token for this machine"
read -n 1 -r -s -p $'    Once you''re done, press any key to continue or Ctrl+C to abort...'
echo ""

# Install Homebrew
command -v brew >/dev/null 2>&1 || \
  (echo '🍺  Installing Homebrew' && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")

# Install XCode tools for Terminal
# if [ ! -f /Library/Developer/CommandLineTools/usr/bin/git ]; then
#  (echo '💰  Installing XCode tools for Terminal' && xcode-select --install)
#fi

# Ask user to install Command Line Tools as the above command doesn't work
echo "🤚  Next, go to https://developer.apple.com/download/all/?q=command%20line%20tools and install Command Line Tools 16.1 (not the latest one)"
read -n 1 -r -s -p $'    Once you''re done, press any key to continue or Ctrl+C to abort...'
echo ""

# Install chezmoi
command -v chezmoi >/dev/null 2>&1 || \
  (echo '👊  Installing chezmoi' && brew install chezmoi)

if [ -d "$HOME/.local/share/chezmoi/.git" ]; then
  echo "🚸  chezmoi already initialized"
  echo "    Reinitialize with: 'chezmoi init https://github.com/pkaramishev/dotfiles.git'"
else
  echo "🚀  Initialize dotfiles with:"
  echo "    chezmoi init https://github.com/pkaramishev/dotfiles.git"
fi

echo ""
echo "Done."
