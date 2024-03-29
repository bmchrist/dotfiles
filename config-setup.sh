#!/bin/bash
# All my config setup <3's @jsvana for much help

function config_link {
  if [[ ! -e ~/.$1 ]]; then
    rm ~/.$1
    ln -s `pwd`/$1 ~/.$1
  fi
}

config_link ackrc
config_link ctags
config_link zsh
config_link zshrc
config_link zprofile
config_link vim
config_link vimrc
config_link hammerspoon

config_link gitconfig
config_link tmux.conf
config_link tmux_statusline
config_link inputrc
config_link irbrc

# don't do this for RDE. Figure out a way for later, for now just getting rid of it as this is not a critical step
#cp ~/.ssh/config ~/.ssh/config-$(date "+%Y-%m-%d.%H:%M:%S").bak
#ln -s `pwd`/ssh-config ~/.ssh/config
