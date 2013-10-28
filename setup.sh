#!/bin/bash
# thanks to @jsvana for dotfiles-foo

bash config-setup.sh

mkdir ~/projects

if [[ `uname -s` == "Darwin" ]]
then
  bash brew-setup.sh
  bash osx-setup.sh
  pip install ipython
elif [[ `uname -s` == "Linux" ]]  
then
  if [[ -e /etc/debian_version ]]
  then
    sudo apt-get -y install git python-pip ipython
  fi
fi

vim +BundleInstall +qall

echo "Done. Note that some of these changes require a logout/restart to take effect."
