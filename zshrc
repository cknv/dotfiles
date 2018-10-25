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

# Go specifics
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Pkg folders
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

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

# Interpret keys correctly
bindkey "^[[H" beginning-of-line # home
bindkey "^[[F" end-of-line # end
bindkey "^[[5~" up-line-or-history # page up
bindkey "^[[6~" down-line-or-history # page down
bindkey "^[[2~" overwrite-mode # insert
bindkey "^[[3~" delete-char # delete
bindkey "^[[1;5D" backward-word # jump backwards
bindkey "^[[1;5C" forward-word # jump forwards

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

# Source the secrets file in home if it exists.
if [ -r $HOME/.secrets ]; then
    source $HOME/.secrets
fi
