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
# Disable opening and closing window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# ==================
# Mouse and Keyboard
# ==================

# Set a blazingly fast keyboard repeat rate
# seems to not be used now
#defaults write NSGlobalDomain InitialKeyRepeat -int 25
#defaults write NSGlobalDomain KeyRepeat -int 1

# Chrome two finger next/previous disabled
defaults write com.google.Chrome.plist AppleEnableSwipeNavigateWithScrolls -bool FALSE

# turn off sound effects?

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

## Save screenshots to preview for easy editing/pasting without saving to disk
defaults write com.apple.screencapture target -string "preview"

# these don't seem to work anymore
## Finder: disable window animations and Get Info animations
#defaults write com.apple.finder DisableAllAnimations -bool true

## Finder: show path bar
#defaults write com.apple.finder ShowPathbar -bool true


# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -int 0

# Move the dock to the left
defaults write com.apple.dock orientation -string left

# Set dock icon size 36 px
defaults write com.apple.dock tilesize -int 12

# Enable dock magnification
defaults write com.apple.dock largesize -float 48

# No process indicator lights
defaults write com.apple.dock show-process-indicators -int 0

# Minimize to app icon
defaults write com.apple.dock minimize-to-application -int 1

for app in "Dashboard" "Dock" "Finder" "SystemUIServer"; do
        killall "$app" > /dev/null 2>&1
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
