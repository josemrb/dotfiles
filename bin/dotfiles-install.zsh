#!/bin/zsh

setopt EXTENDED_GLOB
pwd=${0:a:h}

# prezto
for rcfile in $pwd/../prezto/*(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# tmux
for rcfile in $pwd/../tmux/*(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# vim
for rcfile in $pwd/../vim/*(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

git clone https://github.com/gmarik/Vundle.vim.git "${ZDOTDIR:-$HOME}/.vim/bundle/Vundle.vim"
vim +PluginInstall +qall

# git
for rcfile in $pwd/../git/*(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# ssh
mkdir -p "${ZDOTDIR:-$HOME}/.ssh
for rcfile in $pwd/../ssh/*(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.ssh/${rcfile:t}"
done

