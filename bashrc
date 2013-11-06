export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

HISTCONTROL=ignoredups
HISTTIMEFORMAT="[%F %T] "
HISTIGNORE="ls:la:ll:lla:bg:fg:history:hist:reread:long:short"
shopt -s histappend
shopt -s expand_aliases

source ~/.bash_aliases
source ~/.bash_colors
source ~/.bash_functions

# set the default path to short
short_path

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=setbashprompt
