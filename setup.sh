#!/bin/bash
# thanks to @jsvana for dotfiles-foo

# Requires command line tools and git installed

git submodule init
git submodule update
bash config-setup.sh

mkdir ~/projects

if [[ `uname -s` == "Darwin" ]]
then
  bash brew-setup.sh
  bash osx-setup.sh
  pip install ipython
  
  rbenv version | grep '2.0.0-p247'
  if [[ $? -eq 0 ]]
  then 
    rbenv install 2.0.0-p247
  fi
  rbenv global 2.0.0-p247

  gem install tmuxinator

elif [[ `uname -s` == "Linux" ]]  
then
  if [[ -e /etc/debian_version ]]
  then
    echo "Updating apt-get..."
    sudo apt-get update >/dev/null
    sudo apt-get -y install git python-pip ipython make zsh tmux
  fi
fi

vim +BundleInstall +qall

echo "Done. Note that some of these changes require a logout/restart to take effect."
