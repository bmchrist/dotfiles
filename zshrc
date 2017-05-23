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

export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home

if which rbenv > /dev/null 2>&1
then
  eval "$(rbenv init -)"
fi

. ~/.zsh/tmuxinator.zsh
. ~/.zsh/prompt.zsh
. ~/.zsh/aliases.zsh
if [ -f ~/.zshrc.local ]
then
  . ~/.zshrc.local
fi

stty icrnl # make sure return actaully makes a newline

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"
