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

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gfrm="git checkout master && git fetch && git rebase origin/master"
alias gbrd="git branch --merged master | grep -v master | grep -v stable | xargs git branch -d; git branch-cleanup"
alias gclean="gfrm; gbrd; git gc"



alias :q="exit"
