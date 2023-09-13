autoload -Uz compinit
compinit -u

bindkey -v
export EDITOR=vim

HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_EXPIRE_DUPS_FIRST

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down"

# TODO get rid of these conditionals by just having the script generate the right .rc file for the situation
if [[ `uname -s` == "Darwin" ]]
then
  export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/usr/local/opt/kibana@4.4/bin:/opt/homebrew/Cellar/qt@5/5.15.8_2/bin
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '/Users/ben/projects/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ben/projects/google-cloud-sdk/path.zsh.inc'; fi

  # The next line enables shell command completion for gcloud.
  if [ -f '/Users/ben/projects/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ben/projects/google-cloud-sdk/completion.zsh.inc'; fi
else # Linux
  export PATH="$HOME/.rbenv/bin:$PATH"
fi


if which rbenv > /dev/null 2>&1
then
  eval "$(rbenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
# Not currently using NVM with brew, but if I start to, add a "if which brew" statement here and use this
# . "$(brew --prefix nvm)/nvm.sh"
source "$HOME/.nvm/nvm.sh"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

. ~/.zsh/tmuxinator.zsh
. ~/.zsh/prompt.zsh
. ~/.zsh/aliases.zsh
if [ -f ~/.zshrc.local ]
then
  . ~/.zshrc.local
fi

stty icrnl # make sure return actaully makes a newline
