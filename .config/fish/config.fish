set PATH "$PATH:/home/prokop/.local/lib/python3.8/site-packages/"
export PATH
export DIFFPROG='nvim -d'
export EDITOR='nvim'

alias s  sudo
alias ls "exa --group-directories-first --sort="Extension""
alias sl ls
alias ll "exa --group-directories-first --sort="Extension" -la"
alias cl clear
alias py python
alias packup 'pacman -Qqen > pkglist.txt && pacman -Qqem > pkglist_aur.txt && cat pkglist.txt pkglist_aur.txt > pkglist_full.txt'
