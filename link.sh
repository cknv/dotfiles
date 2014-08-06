#! /bin/sh
set -x

ln -sf $PWD/bashrc $HOME/.bashrc
ln -sf $PWD/bash_colors $HOME/.bash_colors
ln -sf $PWD/bash_aliases $HOME/.bash_aliases
ln -sf $PWD/bash_profile $HOME/.bash_profile
ln -sf $PWD/bash_functions $HOME/.bash_functions

ln -sf $PWD/vimrc $HOME/.vimrc

ln -sf $PWD/gitconfig $HOME/.gitconfig
ln -sf $PWD/git_aliases $HOME/.git_aliases

ln -sf $PWD/abcde.conf $HOME/.abcde.conf

ln -sf $PWD/zshrc $HOME/.zshrc
ln -sf $PWD/zsh_functions $HOME/.zsh_functions

ln -sf $PWD/shell_aliases $HOME/.shell_aliases

ln -sf $PWD/pythonrc.py $HOME/.pythonrc.py

