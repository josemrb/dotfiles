#!/bin/zsh

setopt EXTENDED_GLOB
pwd=${0:a:h}

# prezto
for rcfile in $pwd/prezto/*(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# tmux
for rcfile in $pwd/tmux/*(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# vim
for rcfile in $pwd/vim/*(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

git clone https://github.com/gmarik/Vundle.vim.git "${ZDOTDIR:-$HOME}/.vim/bundle/Vundle.vim"
vim +PluginInstall +qall
