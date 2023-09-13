#!/bin/bash
# thanks to @jsvana for dotfiles-foo

# Requires command line tools, xcode, git

# Some config in here utilizes cloning some other repos, that's where git submodule comes in
# TODO: issue right now that zsh not installed first - fix!
git submodule init
git submodule update

# symlink all the dotfiles
zsh config-setup.sh

mkdir ~/projects

if [[ `uname -s` == "Darwin" ]]
then
  zsh brew-setup.sh

  dscl . read /Users/ben | grep /bin/zsh  # checks user settings for zsh being set
  if [[ $? -eq 1 ]] # If zsh isn't our current shell, change to it being the shell
  then
    chsh -s $(which zsh) $(whoami)
  fi

  # bash osx-setup.sh
  pip install ipython

elif [[ `uname -s` == "Linux" ]]
then
  if [[ -e /etc/debian_version ]]
  then
    echo "Updating apt-get..."
    sudo apt-get update >/dev/null
    sudo apt-get -y install git make zsh tmux
  fi
fi

vim +BundleInstall +qall

echo "Done. Note that some of these changes require a logout/restart to take effect."
