autoload -Uz compinit
compinit -u

export EDITOR=/usr/local/bin/vim

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/ben/Downloads/hadoop-0.20.2/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home

. ~/.zsh/prompt.zsh
. ~/.zsh/aliases.zsh
