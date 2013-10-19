export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export HISTCONTROL=ignoredups
shopt -s histappend
shopt -s expand_aliases

source ~/.bash_aliases

function setprompt() {
	if [ -z != $1 ]; then
		source ~/.bash_colors
		
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
		
		prompt="\[$IWhite\]\$"
		resetcolor="\[$Color_Off\]"
		
		PS1="$status$base $displaypath $time\n$prompt$resetcolor "
		return 0
	else
		echo "invalid option"
		echo "options: \"short\" or \"long\""
		return 1
	fi
}

short
