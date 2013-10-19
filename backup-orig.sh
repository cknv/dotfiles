#! /bin/bash

mkdir $HOME/.orig-dotfiles/

mv $HOME/.bashrc $HOME/.orig-dotfiles/bashrc
mv $HOME/.profile $HOME/.orig-dotfiles/profile
mv $HOME/.bash_colors $HOME/.orig-dotfiles/bash_colors
mv $HOME/.bash_aliases $HOME/.orig-dotfiles/bash_aliases
mv $HOME/.bash_profile $HOME/.orig-dotfiles/bash_profile

mv $HOME/.vimrc $HOME/.orig-dotfiles/vimrc

mv $HOME/.gitconfig $HOME/.orig-dotfiles/gitconfig
mv $HOME/.git_aliases $HOME/.orig-dotfiles/git_aliases

