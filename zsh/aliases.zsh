alias projects="cd ~/projects"
alias dotfiles="cd ~/projects/dotfiles"
alias handshake="cd ~/projects/handshake"

# Django aliases
alias django="python manage.py"
alias djrs="django runserver"
alias djsh="django shell"

alias rsu="unicorn -p 3000 -c ./config/unicorn.rb"
alias rsf="foreman start -f=Procfile.development"
alias rst="rails server thin"

alias ts="tmuxinator start"

alias vbi="vim +BundleInstall +qall"
alias phil="head < /dev/random | mutt -s \"Rand\" -- pjmiddle@mtu.edu"

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gf="git fetch"
alias gd="git diff"
alias gfrm="git checkout master && git fetch && git rebase origin/master"
