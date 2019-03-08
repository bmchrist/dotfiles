#!/bin/bash
# credit for script base: http://mths.be/osx

# TODO - swipe between full, mission control, expose w/ three fingers

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# ===============
# System Settings
# ===============
read -p "Hostname: " hostname
# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "$hostname"
sudo scutil --set HostName "$hostname"
sudo scutil --set LocalHostName "$hostname"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$hostname"

# Disable opening and closing window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# ==================
# Mouse and Keyboard
# ==================
# Expose/Mission control: three fingers (requires logout)
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 2; # Expose and Mission Control
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 2

# Trackpad: swipe between spaces with three fingers (requires logout)
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 2; # between apps/spaces
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 2

# Tap to click on
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 1

# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

# Chrome two finger next/previous disabled
defaults write com.google.Chrome.plist AppleEnableSwipeNavigateWithScrolls -bool FALSE

# ==============
# Other Settings
# ==============
# Set up menubar
defaults write com.apple.systemuiserver menuExtras -array \
  "/System/Library/CoreServices/Menu Extras/Clock.menu" \
  "/System/Library/CoreServices/Menu Extras/Battery.menu" \
  "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
  "/System/Library/CoreServices/Menu Extras/Displays.menu" \
  "/System/Library/CoreServices/Menu Extras/Volume.menu"
defaults write com.apple.menuextra.battery ShowPercent YES
defaults write com.apple.menuextra.clock DateFormat -string 'EEE MMM d  H:mm:ss'

# Save screenshots to screenshots folder
mkdir -p ~/Pictures/Screenshots
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Ensure empty trash securely is false (no need for all that extra I/O -- the drive should be encrypted anyway)
defaults write com.apple.finder EmptyTrashSecurely -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Move the dock to the left
defaults write com.apple.dock orientation -string left

# Set dock icon size 36 px
defaults write com.apple.dock tilesize -int 12

# Enable dock magnification
defaults write com.apple.dock magnification -int 1
defaults write com.apple.dock largesize -float 48

# Enable the 2D Dock
defaults write com.apple.dock no-glass -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Set bottom right hot corner to put display to sleep
defaults write com.apple.dock wvous-br-corner -int 10
defaults write com.apple.dock wvous-br-modifier -int 0

# No process indicator lights
defaults write com.apple.dock show-process-indicators -int 0

# Minimize to app icon
defaults write com.apple.dock minimize-to-application -int 1

# Disable Spotlight indexing for any volume that gets mounted and has not yet been indexed before.
sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

for app in "Dashboard" "Dock" "Finder" "SystemUIServer"; do
        killall "$app" > /dev/null 2>&1
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
