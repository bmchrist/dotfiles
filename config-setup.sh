#!/bin/bash
# All my config setup <3's @jsvana for much help

function config_link {
  if [[ ! -e ~/.$1 ]]; then
    rm ~/.$1
    ln -s `pwd`/$1 ~/.$1
  fi
}

config_link ackrc
config_link zsh
config_link zshrc
config_link zprofile
config_link vim
config_link vimrc
config_link mime.types
config_link hammerspoon

# Terminal mail client config
#config_link mutt
#config_link mailcap
#config_link muttrc

config_link irssi
config_link gitconfig
config_link tmux.conf
config_link tmux_statusline
config_link inputrc
config_link irbrc
config_link rbenv/plugins # Might cause issues when rbenv doesn't already exist - tbd
