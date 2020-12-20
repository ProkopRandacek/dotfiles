# Setup basic config stuff for history size, Vim keybindings, and the like
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob notify
unsetopt nomatch

# Auto-completion (double-tab tab)
zstyle :compinstall filename '/home/terminus/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Make Home, End and Delete do what they should do... not working TODO
bindkey "^[[3~" delete-char
bindkey "^[[8~" end-of-line
bindkey "^[[7~" beginning-of-line

PATH="$PATH:/home/prokop/.local/lib/python3.8/site-packages/"
PATH="$PATH:/home/prokop/.local/bin"
export PATH
export EDITOR='nvim'
export VISUAL='code'
export DIFFPROG='code -d'

alias s='sudo'
alias c='clear'
alias y='yay'

alias re='sudo $(history -p !!)'
alias ls='exa --group-directories-first --sort="Extension" -a'
alias ll='exa --group-directories-first --sort="Extension" -la'
alias sl='ls'
alias py='python'
alias vi='vim'
alias cp='cp --reflink' # https://wiki.archlinux.org/index.php/Btrfs#Creating_lightweight_copies

alias vpn='sudo openvpn /home/prokop/openvpn/client.ovpn'
alias vim='nvim'
alias cal='cal --monday'

alias pingg='ping 8.8.8.8'
alias pingr="ping $(ip route get fibmatch 8.8.8.8 | awk '{print $3}')"
alias ffrec='ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0+0,0 output.mkv'

alias virc='vim ~/.zshrc'

alias backup=/home/prokop/scripts/backup/backup.sh
alias packup=/home/prokop/scripts/backup/packup.sh
alias sshvps='ssh prokop@randacek.dev'
alias sshope='ssh sfs2x@rbxrouter.kenpa.cz -p 4053'

#alias libreoffice='flatpak run org.libreoffice.LibreOffice'

function g {
	echo "$1" >> ~/pkgs
	yay -S "$1"
}

function ff2mp4 {
	ffmpeg -i "$1" "${1%.*}.mp4"
}

function add_to_backup_list {
	echo $PWD/$1 >> ~/backuplist
}

function 2tmp {
	rsync $1 prokop@randacek.dev:/var/www/html/tmp --progress
	echo https://randacek.dev/tmp/$1
}

function mks { # make script
	touch $1 &&
	chmod +x $1 &&
	echo "#!/bin/sh" > $1 &&
	nvim $1
}

function arun { # compile and run compiled alan code
	alan compile $1 "${1%.*}.agc" &&
	touch "run_${1%.*}" &&
	chmod +x "run_${1%.*}" &&
	echo "#!/bin/sh" > "run_${1%.*}" &&
	echo "alan run ${1%.*}.agc" >> "run_${1%.*}" &&
	alan run "${1%.*}.agc"
}

source /home/prokop/scripts/zshprompt
