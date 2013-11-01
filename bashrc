export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

HISTCONTROL=ignoredups
HISTTIMEFORMAT="[%Y-%m-%d %H:%M:%S] "
shopt -s histappend
shopt -s expand_aliases

source ~/.bash_aliases
source ~/.bash_colors

function is_git_repository {
	git branch > /dev/null 2>&1
}

# Determine the branch/state information for this git repository.
function set_git_branch {
	if is_git_repository ; then
		# Capture the output of the "git status" command.
		git_status="$(git status 2> /dev/null)"

		# Set color based on clean/staged/dirty.
		if [[ ${git_status} =~ "working directory clean" ]]; then
			state="$Green"
		elif [[ ${git_status} =~ "Changes to be committed" ]]; then
			state="$Yellow"
		else
			state="$IRed"
		fi

		# Set arrow icon based on status against remote.
		remote_pattern="# Your branch is (.*) of"
		if [[ ${git_status} =~ ${remote_pattern} ]]; then
			if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
				remote="↑"
			else
				remote="↓"
			fi
		else
			remote=""
		fi
		diverge_pattern="# Your branch and (.*) have diverged"
		if [[ ${git_status} =~ ${diverge_pattern} ]]; then
			remote="↕"
		fi

		# Get the name of the branch.
		branch_pattern="^# On branch ([^${IFS}]*)"
		if [[ ${git_status} =~ ${branch_pattern} ]]; then
			branch=${BASH_REMATCH[1]}
		fi

		# Set the final branch string.
		gitbranch="${state}(${branch})${remote}${COLOR_NONE} "
	else
		gitbranch=""
	fi
}

function set_virtualenv () {
	# Determine active Python virtualenv details.
	if test -z "$VIRTUAL_ENV" ; then
		pvenv=""
	else
		pvenv="$Yellow[`basename \"$VIRTUAL_ENV\"`] "
	fi
}

# Set the full bash prompt.
function setbashprompt() {
	# Set the status variable. We do this first so we don't lose the
	# return value of the last command.
	
	status="\$([[ \$? != 0 ]] && echo \"$Red x \")"
	
	# set basic info
	username="$IBlue\u"
	host="$IRed\h"
	time="$IBlack\t"
	
	# Set the PYTHON_VIRTUALENV variable.
	set_virtualenv

	# Set the BRANCH variable.
	set_git_branch
	
	if [[ $EUID == 0 ]]; then
		base="$Red\h"
	else
		base=$username$IWhite@$host
	fi
	
	# Set the bash prompt variable.
	prompt="$IWhite\$"
	resetcolor="$Color_Off"
	
	# PS1="$status$base $displaypath $time $gitbranch\n$pvenv$prompt$resetcolor "
	PS1="$status$base $displaypath $gitbranch$time\n$pvenv$prompt$resetcolor "
}

function short_path {
	displaypath="$Blue\W"
}

function long_path {
	displaypath="$Blue\w"
}

# set the default path to short
short_path

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=setbashprompt
