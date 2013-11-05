autoload -Uz compinit
compinit -u

export EDITOR=vim

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home

eval "$(rbenv init -)"

. ~/.zsh/tmuxinator.zsh
. ~/.zsh/prompt.zsh
. ~/.zsh/aliases.zsh
. ~/.zshrc.local
