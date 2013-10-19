export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export HISTCONTROL=ignoredups
shopt -s histappend
shopt -s expand_aliases

source ~/.bash_colors
source ~/.bash_aliases

function setprompt() {
	if [ -z != $1 ]; then
		# prefix="\[\033[0;37m\]\342\224\214\342\224\200"
		# prefix="\[\033[0;37m\]"
		
		status="\$([[ \$? != 0 ]] && echo \"\[$Red\]x \[$White\]\")"
		# username="\[\033[0;33m\]\u\[\033[0;37m\]"
		username="\[$IPurple\]\u\[$White\]"
		
		host="\[$IRed\]\h\[$White\]"
		# secondline="\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"
		secondline="\n\[$White\]\$ \[$Color_Off\]"
		
		date="\D{%H:%M:%S}"
		
		if [[ $EUID == 0 ]]; then
			base="\[$Red\]\h"
		else
			base=$username$IWhite'@'$host
		fi
		
		if [ $1 = "long" ]; then
			displaypath="\[$Blue\]\w\[$White\]"
		elif [ $1 = "short" ]; then
			displaypath="\[$Blue\]\W\[$White\]"
		fi
		
		PS1="$status$base $displaypath$secondline"
	fi
}

# long

# normal prompt
# PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\$\[\033[00m\] "

# special prompts:
# https://wiki.archlinux.org/index.php/Color_Bash_Prompt#Variations_on_a_theme

# PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\""

# PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"
# PS1='[\u@\h \W]\$ '

# echo `$PS1`
# P_USER='\u@'