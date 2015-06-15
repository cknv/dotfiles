# History control.
HISTFILE=~/.hist
HISTSIZE=1000
SAVEHIST=1000

setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
# HISTIGNORE="ls:reread:short:long:pwd:git s:git diff:git l*"

# Python specifics.
export PYTHONDONTWRITEBYTECODE=1
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PYTHONSTARTUP=~/.pythonrc.py
eval "`pip completion --zsh`"

# Source venv
source /usr/bin/virtualenvwrapper.sh 2> /dev/null

# Export defaults
export EDITOR=$(which nano)
export VISUAL=$(which vim)

# Export config folder
export XDG_CONFIG_HOME="$HOME/.config"

# Prompt expansion is needed.
setopt PROMPT_SUBST

# Gief colors!
autoload -U colors && colors

# Completion is nice too.
autoload -U compinit && compinit
setopt complete_in_word
setopt correct

alias reread='source $HOME/.zshrc'
source ~/.shell_aliases
source ~/.zsh_functions

# Get home and end working:
autoload zkbd
source ~/.carbon_keyboard

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# Set the path display length default:
path_length=1
default_title

PROMPT=$'$(return_status)$(base_prompt)$(display_path)$(display_git)$(command_runtime)\n$(virtualenv_info)> '

# Open new tabs in the same directory:
source /etc/profile.d/vte.sh

# Forward searching with Ctrl+s
stty -ixon

# ZSH syntax hightlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
