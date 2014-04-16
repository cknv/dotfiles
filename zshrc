export WORKON_HOME=$HOME/.virtualenvs
export VIRTUAL_ENV_DISABLE_PROMPT=1
source /usr/local/bin/virtualenvwrapper.sh

setopt PROMPT_SUBST

autoload -U colors && colors

alias reread='source $HOME/.zshrc'

path_length=1

function short() {
    path_length=1
}

function long() {
    path_length=0
}

function display_path() {
    echo " %{$fg[blue]%}%$path_length~%{$reset_color%}"
}

function display_time() {
    echo " %{$fg[black]%}%*%{$reset_color%}"
}

function base_prompt() {
    if [ $? -eq 0 ]; then
        local display_status=""
    else
        local display_status="%{$fg[red]%} x %{$reset_color%}"
    fi

    local display_user="%{$fg[green]%}%n%{$reset_color%}"
    local display_host="%{$fg[red]%}%M%{$reset_color%}"
    echo "$display_status$display_user@$display_host"
}

function display_git() {
    # Capture the output of the "git status" command.
    local git_status="$(git status 2> /dev/null)"
    branch_pattern="^# On branch ([^[:space:]]*)"
    if [[ ${git_status} =~ ${branch_pattern} ]]; then
        branch=${match[1]}
    fi

    # Set the status color based on how clean the working directory is.
    if [[ ${git_status} =~ "working directory clean" ]]; then
        state="$fg[green]"
    elif [[ $git_status =~ "Changes to be committed" ]]; then
        state="$fg[yellow]"
    else
        state="$fg[red]"
    fi

    # Set arrow icon based on status against remote.
    remote_pattern="# Your branch is (ahead|behind)"
    diverge_pattern="# Your branch and (.*) have diverged"
    if [[ ${git_status} =~ ${remote_pattern} ]]; then
        if [[ ${match[1]} == "ahead" ]]; then
            remote=" >>"
        elif [[ ${match[1]} == "behind" ]]; then
            remote=" <<"
        fi

        # Set the number of commits we are behind ahead while we are at it.
        commits_pattern="([0-9]+) (commit|commits)"
        if [[ ${git_status} =~ ${commits_pattern} ]]; then
            remote="${remote} ${match[1]} ${match[2]}"
        fi
    elif [[ ${git_status} =~ ${diverge_pattern} ]]; then
        remote=" ??"
    else 
        remote=""
    fi

    echo " $state($branch)$remote$reset_color"
}

function virtualenv_info() {
    [ $VIRTUAL_ENV ] && echo "%{$fg[yellow]%}[`basename $VIRTUAL_ENV`]%{$reset_color%} "
 }

PS1=$'$(base_prompt)$(display_path)$(display_git)$(display_time)\n$(virtualenv_info)> '
