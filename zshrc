# History control.
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
# HISTIGNORE="ls:reread:short:long:pwd:git s:git diff:git l*"

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
