export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export HISTCONTROL=ignoredups
shopt -s histappend
shopt -s expand_aliases

source ~/.bash_aliases

function setprompt() {
	# inspiration found at the arch linux wiki
	# https://wiki.archlinux.org/index.php/Color_Bash_Prompt
	if [ -z != $1 ]; then
		source ~/.bash_colors
		source /etc/bash_completion.d/git-prompt
		
		status="\$([[ \$? != 0 ]] && echo \" \[$BIRed\]x \")"
		username="\[$IBlue\]\u"
		host="\[$IRed\]\h"
		time="\[$IBlack\]\t"
		
		if [[ $EUID == 0 ]]; then
			base="\[$Red\]\h"
		else
			base=$username$IWhite'@'$host
		fi
		
		if [ $1 = "long" ]; then
			displaypath="\[$Blue\]\w"
		elif [ $1 = "short" ]; then
			displaypath="\[$Blue\]\W"
		fi
		
		gitbranch='$(__git_ps1 "\[$Yellow\](%s)")'
		
		prompt="\[$IWhite\]\$"
		resetcolor="\[$Color_Off\]"
		# PS1='$(__git_ps1 "(%s)")${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\w\[\033[00m\] \$ '
		PS1="$status$base $displaypath $time $gitbranch\n$prompt$resetcolor "
		return 0
	else
		echo "invalid option"
		echo "options: \"short\" or \"long\""
		return 1
	fi
}

PROMPT_COMMAND=setprompt short

