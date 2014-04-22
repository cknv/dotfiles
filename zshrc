export WORKON_HOME=$HOME/.virtualenvs
export VIRTUAL_ENV_DISABLE_PROMPT=1
source /usr/local/bin/virtualenvwrapper.sh

setopt PROMPT_SUBST

autoload -U colors && colors

alias reread='source $HOME/.zshrc'
source ~/.shell_aliases
source ~/.zsh_functions

path_length=1

PROMPT=$'$(base_prompt)$(display_path)$(display_git)$(display_time)\n$(virtualenv_info)> '

function precmd() {
    print -Pn '\e]2;%$path_length~\a'
}
