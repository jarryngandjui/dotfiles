#!/bin/bash

# Main diecotries 
export PROJECTS=$HOME/Projects
export DOTFILES=$HOME/dotfiles
export CONFIG=$DOTFILES/files
export ZSHRC=$CONFIG/zshrc
export ZSHPROFILE=$CONFIG/zprofile
export ZSHALIAS=$CONFIG/zsh/alias.sh
export ZSHENV=$CONFIG/zsh/env.sh
export ALACRITTYCONFIG=$CONFIG/alacritty/alacritty.oml
export NVIMINIT=$CONFIG/nvim/init.lua
export NVIMLOCK=$CONFIG/nvim/lazy-lock.json

alias projects="cd $PROJECTS"
alias dotfiles="cd $DOTFILES"
alias zshrc="nvim $ZSHRC"
alias zshalias="nvim $ZSHALIAS"
alias zshenv="nvim $ZSHENV"
alias alacrittyconfig="nvim $ALACRITTYCONFIG"
alias nviminit="nvim $NVIMINIT"
