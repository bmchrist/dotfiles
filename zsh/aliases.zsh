alias projects="cd ~/projects"
alias dotfiles="cd ~/projects/dotfiles"

# handshake stuff
alias hs="cd ~/projects/handshake"
alias rsf="foreman start"
alias rsfd="foreman start -f Procfile.dev"

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
alias gfrm="git checkout main && git fetch && git rebase origin/main"
alias gbrd="git branch --merged main | grep -v main | grep -v stable | xargs git branch -d; git branch-cleanup"
alias gclean="gfrm; gbrd; git gc"
alias gcf="git branch | cut -c 3- | fzf | xargs git checkout"

alias gfs="gclean && git checkout -b"
alias gfp="git rev-parse --abbrev-ref HEAD | xargs git push -u origin"
