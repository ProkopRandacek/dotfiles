# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH="$PATH:/home/prokop/.local/lib/python3.8/site-packages/"
PATH="$PATH:/home/prokop/.local/bin"
export PATH
export EDITOR='nvim'
export VISUAL="nvim"
export DIFFPROG='nvim -d'

alias s=sudo
alias r=ranger
alias c=clear
alias ls="exa --group-directories-first --sort="Extension""
alias ll="exa --group-directories-first --sort="Extension" -la"
alias sl=ls
alias py=python
alias pingg="ping 8.8.8.8"
alias pingr="ping $(route -n | grep UG | awk '{print $2}')"
alias backup=/home/prokop/scripts/backup/backup.sh
alias packup=/home/prokop/scripts/backup/packup.sh

function add_to_backup_list {
	echo $PWD/$1 >> ~/backuplist
}

function sudo {
    if test "$1" = ""
	then
		eval command sudo $(echo $!)
    else
        command sudo $1
	fi
}

# === FISH PROMPT ===

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]
then
	SESSION_TYPE="remote/ssh"
fi

tput init

r="$(tput setaf 1)"
g="$(tput setaf 2)"
y="$(tput setaf 3)"
b="$(tput setaf 33)"
bold="\E[1m"
e="$(tput sgr0)"

username()
{
	printf ${g}$USER${e}
}

hostname()
{
	if [[ $SESSION_TYPE == "remote/ssh" ]]
	then
		printf "${y}"
	fi
	printf $(cat /etc/hostname)
}

short_path()
{
	short="$PWD"
	home="$HOME"
	IFS="/"
	h="~"
	printf ${g}
	if [[ $short == $HOME* ]]
	then
		short="${short/$home/$h}"
		printf "~"
	fi
	if [[ $short == $h ]]
	then
		printf ${e}
		return
	fi
	read -r -a arr <<< "$short"
	x="${#arr[@]}"
	x="$(expr $x - 2)"
	for i in "${arr[@]:1:$x}"
	do
		printf "/${i:0:1}"
	done
	printf "/${arr[-1]}"
	printf ${e}
}

git_branch()
{
	branch="$(git branch 2> /dev/null | awk '{split($0,a," "); print a[2]}')"
	if [[ $branch != "" ]]
	then
		printf " ("$branch")"
	fi
}

exitstatus()
{
    if [[ $1 != 0 ]]
	then
		printf " "${r}[${e}${r}${bold}$1${e}${r}]${e}
    fi
}

prompt()
{
	printf "$(username)@$(hostname) $(short_path)$(git_branch)$(exitstatus $1)> "
}
PS1='$(prompt $?)'
