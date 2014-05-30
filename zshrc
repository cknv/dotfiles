# History control.
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
# HISTIGNORE="ls:reread:short:long:pwd:git s:git diff:git l*"

# Python specifics.
export PYTHONDONTWRITEBYTECODE=1
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Source venv
source /usr/bin/virtualenvwrapper.sh 2> /dev/null
# And if we aren't on arch.
source /usr/local/bin/virtualenvwrapper.sh 2> /dev/null

# Export defaults
export EDITOR=$(which nano)
export VISUAL=$(which vim)

# Prompt expansion is needed.
setopt PROMPT_SUBST

# Gief colors!
autoload -U colors && colors

# Completion is nice too.
autoload -U compinit
compinit

alias reread='source $HOME/.zshrc'
source ~/.shell_aliases
source ~/.zsh_functions

# Set the path display length default:
path_length=1
chpwd

PROMPT=$'$(base_prompt)$(display_path)$(display_git)$(command_runtime)\n$(virtualenv_info)> '
