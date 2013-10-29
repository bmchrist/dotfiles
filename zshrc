autoload -Uz compinit
compinit -u

export EDITOR=/usr/local/bin/vim

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home

export PATH=$PATH:/Users/ben/Downloads/ThreadMentor/fedora4/bin
. ~/.zsh/prompt.zsh
. ~/.zsh/aliases.zsh
