#! /bin/sh
set -x

ln -sf $PWD/vimrc $HOME/.vimrc
mkdir --parents $HOME/.config/nvim
ln -sf $PWD/nvim.init $HOME/.config/nvim/init.vim

ln -sf $PWD/gitconfig $HOME/.gitconfig
ln -sf $PWD/git_aliases $HOME/.git_aliases
ln -sf $PWD/git_ignore $HOME/.gitignore
ln -sf $PWD/git_work_config $HOME/.git_work_config

ln -sf $PWD/abcde.conf $HOME/.abcde.conf

ln -sf $PWD/zshrc $HOME/.zshrc
ln -sf $PWD/zsh_functions $HOME/.zsh_functions
ln -sf $PWD/carbon_keyboard $HOME/.carbon_keyboard

ln -sf $PWD/shell_aliases $HOME/.shell_aliases

ln -sf $PWD/editorconfig $HOME/.editorconfig
