#!/bin/bash

type brew
if [[ $? -eq 1 ]]; then # if type brew returned that brew was not found (aka not installed)
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

source ~/.zshrc

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# ------------------
# Misc tools
# ------------------
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install Bash 4
brew install bash
# Install wget with IRI support
brew install wget

brew install ack

brew install grep

brew install git

brew install tmux
brew install reattach-to-user-namespace # For copying from tmux

brew install vim

# ------------------
# Language/environment specific tools
# ------------------
brew install heroku-toolbelt

brew install python

brew install rbenv ruby-build # we will install ruby through this

brew install nvm # basically rbenv/rvm for node

brew install ghc # haskell

#brew install mutt
#brew install w3m # for html display w/ mutt

# ------------------
# Install native apps
# ------------------
brew tap homebrew/cask

function cask_install() {
  brew install "${@}" --cask
}

# Core Utility
cask_install iterm2
cask_install firefox
# cask_install 1password
cask_install sublime-text
#cask_install flux
cask_install nosleep
cask_install hammerspoon # ctrl to superkey. Also configure in keyboard settings caps lock to ctrl

# Additional Utility
cask_install caffeine
#cask_install google-chrome
#cask_install tor-browser
cask_install spotify
cask_install vlc

# Collaboration
#cask_install slack
#cask_install skype
#cask_install zoomus

# Misc
cask_install virtualbox
cask_install gog-galaxy # games
cask_install steam # games

brew cleanup

echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
