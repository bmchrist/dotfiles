#!/bin/bash
# thanks to @jsvana for dotfiles-foo

bash config-setup.sh

mkdir ~/projects

if [[ `uname -s` == "Darwin" ]]
then
  bash brew-setup.sh
  bash osx-setup.sh
elif [[ `uname -s` == "Linux" ]]  
then
  echo "yo"
fi

vim +BundleInstall +qall
pip install ipython

echo "Done. Note that some of these changes require a logout/restart to take effect."
