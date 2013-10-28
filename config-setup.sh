#!/bin/bash
# All my config setup <3's @jsvana for much help

function config_link {
  if [[ ! -e ~/.$1 ]]
  then
    ln -s `pwd`/$1 ~/.$1
  fi
}

config_link zsh
config_link zshrc
config_link vim
config_link vimrc
config_link mutt
config_link muttrc
config_link irssi
