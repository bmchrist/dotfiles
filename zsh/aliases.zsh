alias projects="cd ~/projects"
alias dotfiles="cd ~/projects/dotfiles"

# handshake stuff
alias hs="cd ~/projects/handshake"
alias rsu="unicorn -p 3000 -c ./config/unicorn.rb"
alias rsf="foreman start"
alias rst="rails server thin"
alias hrc="heroku run rails c --app"

# Django aliases
alias django="python manage.py"
alias djrs="django runserver"
alias djsh="django shell"

alias ts="tmuxinator start"

alias vbi="vim +PluginInstall! +qall"
alias phil="head < /dev/random | mutt -s \"Rand\" -- pjmiddle@mtu.edu"

alias :q="exit"

# Git for days
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gd="git diff"
alias gfrm="git checkout master && git fetch && git rebase origin/master"
alias gbrd="git branch --merged master | grep -v master | grep -v stable | xargs git branch -d; git branch-cleanup"
alias gclean="gfrm; gbrd; git gc"
alias gcf="git branch | cut -c 3- | pick | xargs git checkout"

alias gfs="gclean && git checkout -b"
alias gfp="git rev-parse --abbrev-ref HEAD | xargs git push -u origin"
## Zenflowwwwww
#alias zfs="zenflow feature start --offline"
#alias zhs="zenflow hotfix start --offline"

#alias zfu="zenflow feature update"
#alias zhu="zenflow hotfix update"

#alias zfp="zenflow feature publish"
#alias zhp="zenflow hotfix publish"

#alias zhup="zhu && zhp"
#alias zfup="zfu && zfp"

#alias zfr="zenflow feature review"
#alias zhr="zenflow hotfix review"

#alias zff="zenflow feature finish"
#alias zhf="zenflow hotfix finish"
