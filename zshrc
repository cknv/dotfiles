# History configuration:
HISTFILE=~/.hist
HISTSIZE=7500
SAVEHIST=10000

# Save timestamps with history entries
setopt INC_APPEND_HISTORY_TIME
setopt EXTENDED_HISTORY

# remove duplicates when saving the history
setopt HIST_EXPIRE_DUPS_FIRST

# ignore all entries starting with spaces
setopt HIST_IGNORE_SPACE

# just keep the most recent duplicate
setopt HIST_SAVE_NO_DUPS

#setopt SHARE_HISTORY
# skip duplicates when searching
setopt HIST_FIND_NO_DUPS

# load found entry into buffer instead of running directly
setopt HIST_VERIFY

# load completion helper functions
autoload -Uz compinit
compinit

# Python specifics.
export PYTHONDONTWRITEBYTECODE=1
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUAL_ENV_DISABLE_PROMPT=1
eval "`pip completion --zsh`"

# Go specifics
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Pkg folders
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
# LD config
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

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

PROMPT=$'$(return_status)$(base_prompt)$(display_path)$(display_git)$(command_runtime)\n$(shell_with_venv_info) '

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

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
