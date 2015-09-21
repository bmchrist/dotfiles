alias projects="cd ~/projects"
alias dotfiles="cd ~/projects/dotfiles"

# handshake stuff
alias handshake="cd ~/projects/handshake"
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

# Zenflowwwwww
alias zfs="bundle exec zenflow feature start"
alias zhs="bundle exec zenflow hotfix start"

alias zfu="bundle exec zenflow feature update"
alias zhu="bundle exec zenflow hotfix update"

alias zfp="bundle exec zenflow feature publish"
alias zhp="bundle exec zenflow hotfix publish"

alias zfr="bundle exec zenflow feature review"
alias zhr="bundle exec zenflow hotfix review"

alias zff="bundle exec zenflow feature finish"
alias zhf="bundle exec zenflow hotfix finish"
