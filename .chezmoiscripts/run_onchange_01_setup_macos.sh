#! /bin/sh

# To find settings that were changed manually, run
# $ defaults read > before
# change it manually
# $ defaults read > after
# $ diff before after

echo "🎨  Customizing MacOS settings"

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Use metric units
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"

# Save to disk by default, instead of iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Set menu bar clock format
defaults write com.apple.menuextra.clock IsAnalog -bool false

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone "Europe/Moscow" 2>/dev/null 1>&2

###############################################################################
# Peripherals                                                                 #
###############################################################################

# Disable automatic text substitution and autocorrect
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable “natural” scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

###############################################################################
# Finder                                                                      #
###############################################################################

# Set default location for new Finder windows
# Desktop: `PfDe`, `file://${HOME}/Desktop/`. For other paths: `PfLo`
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Prefer Finder tabs: Dock -> Prefer tabs when opening documents
defaults write NSGlobalDomain AppleWindowTabbingMode -string "always"

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# View files as list
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

###############################################################################
# Menu bar, Dock, Dashboard, and hot corners                                  #
###############################################################################

# Bluetooth: always show in menu bar
defaults -currentHost write com.apple.controlcenter Bluetooth -int 18

# Sound: always show in menu bar
defaults -currentHost write com.apple.controlcenter Sound -int 18

# Battery - show percentage
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

# Clock options... show AM/PM: false
defaults write com.apple.menuextra.clock Show24Hour -int 1

# Auto-hide menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "genie"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Wipe default macOS app icons from the Dock
# Useful for setting up new Macs. Optionally relaunch dock with `killall Dock`.
defaults write com.apple.dock persistent-apps -array

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Group windows by application in Mission Control
defaults write com.apple.dock expose-group-by-app -bool true

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Set the icon size of Dock items to 32 pixels
defaults write com.apple.dock tilesize -int 32

# Position on screen: bottom
defaults write com.apple.dock orientation -string bottom

# Automatically hide and show the dock: false
defaults write com.apple.dock autohide -bool false

# Show indicators for open applications: true
defaults write com.apple.dock show-process-indicators -bool true

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock screen
# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom right screen corner → Mission Control
defaults write com.apple.dock wvous-br-corner -int 2
defaults write com.apple.dock wvous-br-modifier -int 0
# Bottom left screen corner
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0

###############################################################################
# Networking                                                                  #
###############################################################################

###############################################################################
# TextEdit                                                                    #
###############################################################################

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

###############################################################################
# Transmission                                                                #
###############################################################################

defaults write org.m0k.transmission AutoSize -bool false
defaults write org.m0k.transmission AutoStartDownload -bool true
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
defaults write org.m0k.transmission BlocklistURL -string \
  "https://github.com/Naunter/BT_BlockLists/raw/master/bt_blocklists.gz"
defaults write org.m0k.transmission CheckDownload -bool false
defaults write org.m0k.transmission CheckQuit -bool false
defaults write org.m0k.transmission CheckRemove -bool true
defaults write org.m0k.transmission CheckRemoveDownloading -bool true
defaults write org.m0k.transmission CheckUpload -bool false
defaults write org.m0k.transmission DeleteOriginalTorrent -bool false
defaults write org.m0k.transmission DisplayProgressBarAvailable -bool true
defaults write org.m0k.transmission DownloadAsk -bool true
defaults write org.m0k.transmission DownloadAskManual -bool false
defaults write org.m0k.transmission DownloadAskMulti -bool false
defaults write org.m0k.transmission DownloadLocationConstant -bool false
defaults write org.m0k.transmission EncryptionRequire -bool true
defaults write org.m0k.transmission MagnetOpenAsk -bool false
defaults write org.m0k.transmission PeersTorrent -int 10
defaults write org.m0k.transmission PeersTotal -int 200
defaults write org.m0k.transmission PlayDownloadSound -bool false
defaults write org.m0k.transmission RandomPort -bool false
defaults write org.m0k.transmission SleepPrevent -bool true
defaults write org.m0k.transmission SmallView -bool true
defaults write org.m0k.transmission SpeedLimitDownloadLimit -int 2000
defaults write org.m0k.transmission SpeedLimitUploadLimit -int 1000
defaults write org.m0k.transmission SUEnableAutomaticChecks -bool false
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool false
defaults write org.m0k.transmission WarningDonate -bool false
defaults write org.m0k.transmission WarningLegal -bool false

###############################################################################
# Wi-Fi                                                                       #
###############################################################################


###############################################################################
# Bluetooth                                                                   #
###############################################################################


###############################################################################
# Notifications                                                               #
###############################################################################

###############################################################################
# Sound                                                                       #
###############################################################################

# Alert volume
defaults write .GlobalPreferences com.apple.sound.beep.volume -float 0.5
# Play feedback when volume is changed
defaults write .GlobalPreferences com.apple.sound.beep.feedback -bool true

###############################################################################
# Focus                                                                       #
###############################################################################

###############################################################################
# Screen Time                                                                 #
###############################################################################

###############################################################################
# Software Update                                                             #
###############################################################################

# sudo softwareupdate --schedule ON
# sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticCheckEnabled -bool YES

###############################################################################
# Accessibility                                                               #
###############################################################################

###############################################################################
# Privacy & Security                                                          #
###############################################################################

###############################################################################
# Lock Screen                                                                 #
###############################################################################

# Start screen saver when inactive for X seconds
defaults -currentHost write com.apple.screensaver -int 300

# Turn display off on battery when inctive for X minutes
sudo pmset -b displaysleep 10

# Turn display off on power adapter when inctive for X minutes
sudo pmset -c displaysleep 10

###############################################################################
# Apply Settings                                                              #
###############################################################################

processes=(
    Dock
    Finder
    SystemUIServer
    "System Settings"
)

for process in "${processes[@]}"; do
    if pgrep "$process" &> /dev/null ; then 
        sudo killall "$process" ; 
    fi
done

echo "✅  Done. Note that some of these changes require a logout/restart to take effect."