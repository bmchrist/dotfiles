#!/bin/bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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
brew install mutt
brew install w3m # for html display w/ mutt
brew install tmux
brew install rbenv ruby-build
brew install ghc

# Install native apps
brew tap phinze/homebrew-cask
brew install brew-cask

function cask_install() {
  brew cask install "${@}"
}

cask_install dropbox
cask_install firefox
cask_install iterm2
cask_install sublime-text
cask_install google-chrome
cask_install slate
cask_install steam
cask_install spotify
cask_install karabiner
cask_install seil
cask_install utorrent
cask_install flash
cask_install cord
cask_install flux
cask_install virtualbox
cask_install nosleep
cask_install duet
cask_install caffeine
cask_install mailbox

brew cleanup

echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
