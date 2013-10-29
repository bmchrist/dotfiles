#!/bin/bash

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

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
brew install ack
brew install mutt
brew install w3m # for html display w/ mutt

# Install native apps
brew tap phinze/homebrew-cask
brew install brew-cask

function cask_install() {
  brew cask install "${@}" 2> /dev/null
}

cask_install dropbox
cask_install firefox
cask_install iterm2
cask_install sublime-text

brew cleanup

echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
