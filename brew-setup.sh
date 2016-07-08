#!/bin/bash

type brew
if [[ $? -eq 1 ]]; then # if type brew returned that brew was not found (aka not installed)
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install Bash 4
brew install bash
# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew tap josegonzalez/homebrew-php
brew install php55

brew install git
brew install python
brew install ack
#brew install mutt
brew install heroku-toolbelt
#brew install w3m # for html display w/ mutt
brew install tmux
brew install rbenv ruby-build
brew install nvm # basically rbenv/rvm for node
brew install ghc
brew install vim
brew install reattach-to-user-namespace # For copying from tmux

# Gosh I love thoughtbot
brew tap thoughtbot/formulae
brew install pick # fuzzy matching

# Install native apps
brew tap phinze/homebrew-cask
brew install brew-cask

function cask_install() {
  brew cask install "${@}"
}

cask_install balsamiq
cask_install caffeine
#cask_install cord # remote desktop
cask_install divvy
cask_install deluge
cask_install dropbox
cask_install duet
cask_install firefox
cask_install flash
cask_install flux
cask_install gotomeeting
cask_install google-chrome
cask_install iterm2
cask_install karabiner # for key bindings
#cask_install mailbox # :( defunct.
cask_install monity
cask_install nosleep
cask_install screenhero
cask_install seil # for key bindings
cask_install skype
#cask_install slate # using divvy isntead
cask_install spotify
cask_install steam
cask_install teamspeak
cask_install torbrowser
cask_install sublime-text
cask_install virtualbox
cask_install vlc

brew cleanup

echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
