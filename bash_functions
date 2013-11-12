function set_virtualenv () {
	# Determine active Python virtualenv details.
	if test -z "$VIRTUAL_ENV" ; then
		pvenv=""
	else
		pvenv="$Yellow[`basename \"$VIRTUAL_ENV\"`] "
	fi
}

function is_git_repository {
	git branch > /dev/null 2>&1
}

# Determine the branch/state information for this git repository.
function set_git_branch {
	if is_git_repository ; then
		# Capture the output of the "git status" command.
		git_status="$(git status 2> /dev/null)"

		# Set color based on clean/staged/dirty.
		if [[ $git_status == *"working directory clean"* ]]; then
			state="$Green"
		elif [[ $git_status == *"Changes to be committed"* ]]; then
			state="$Yellow"
		else
			state="$IRed"
		fi

		# Set arrow icon based on status against remote.
		remote_pattern="# Your branch is (ahead|behind) "
		if [[ $git_status =~ $remote_pattern ]]; then
			if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
				remote=" >>"
			elif [[ ${BASH_REMATCH[1]} == "behind" ]]; then
				remote=" <<"
			fi
		else
			remote=""
		fi
		
		# Set the number of commits your branch is behind or ahead.
		commits_pattern="([0-9]+) (commit|commits)"
		if [[ $git_status =~ $commits_pattern ]]; then
			remote="${remote} ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}"
		fi
		
		diverge_pattern="# Your branch and (.*) have diverged"
		if [[ $git_status =~ $diverge_pattern ]]; then
			remote=" ??"
		fi

		# Get the name of the branch.
		branch_pattern="^# On branch ([^$IFS]*)"
		if [[ $git_status =~ $branch_pattern ]]; then
			branch=${BASH_REMATCH[1]}
		fi

		# Set the final branch string.
		gitbranch="$state($branch)$remote "
	else
		gitbranch=""
	fi
}

function short_path {
	displaypath="$Blue\W"
}

function long_path {
	displaypath="$Blue\w"
}

# Set the full bash prompt.
function setbashprompt() {
	# Set the status variable. We do this first so we don't lose the
	# return value of the last command.
	if [[ $? != 0 ]]; then
		status="$Red x "
	else
		status=""
	fi

	# set basic info
	username="$DGreen\u"
	host="$Red\h"
	time="$IBlack\t"

	# Set the pvenv variable.
	set_virtualenv

	# Set the branch variable.
	set_git_branch

	if [[ $EUID == 0 ]]; then
		base="$Red\h"
	else
		base=$username$White@$host
	fi

	# Set the bash prompt variable.
	prompt="$IWhite\$"
	resetcolor="$Color_Off"

	title $PWD

	PS1="$status$base $displaypath $gitbranch$time\n$pvenv$prompt$resetcolor "
}

function title() {
	echo -ne "\033]2;terminal `basename $1`\007"
}

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}
