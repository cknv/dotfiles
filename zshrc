# History control.
setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
HISTIGNORE="ls:reread:short:long:pwd"

# Python specifics.
export PYTHONDONTWRITEBYTECODE=1
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUAL_ENV_DISABLE_PROMPT=1
source /usr/local/bin/virtualenvwrapper.sh

# Prompt expansion is needed.
setopt PROMPT_SUBST

# Gief colors!
autoload -U colors && colors

alias reread='source $HOME/.zshrc'
source ~/.shell_aliases
source ~/.zsh_functions

# Set the path display length default:
path_length=1

PROMPT=$'$(base_prompt)$(display_path)$(display_git)$(display_time)\n$(virtualenv_info)> '

function precmd() {
    print -Pn '\e]2;%$path_length~\a'
}
