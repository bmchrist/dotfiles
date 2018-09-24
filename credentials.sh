# Generate SSH keys for Github
read -p "Passphrase for Github? " passphrase
ssh-keygen -q -t rsa -b 4096 -C "$(hostname) - $(date "+%Y-%m-%d")" -f ~/.ssh/github_rsa -N "$passphrase"
