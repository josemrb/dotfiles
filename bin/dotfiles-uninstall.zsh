#!/bin/zsh

setopt EXTENDED_GLOB
pwd=${0:a:h}

# prezto
for rcfile in $pwd/../prezto/*(.N); do
  rm "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

rm -rf "${ZDOTDIR:-$HOME}/.zprezto"

# tmux
for rcfile in $pwd/../tmux/*(.N); do
  rm "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# vim
for rcfile in  $pwd/../vim/*(.N); do
  rm "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

rm -rf "${ZDOTDIR:-$HOME}/.vim/bundle" 

# git
for rcfile in $pwd/../git/*(.N); do
  rm "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# ssh
for rcfile in $pwd/../ssh/*(.N); do
  rm "${ZDOTDIR:-$HOME}/.ssh/${rcfile:t}"
done
