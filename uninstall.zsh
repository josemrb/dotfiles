#!/bin/zsh

setopt EXTENDED_GLOB

# prezto
for rcfile in ./prezto/*(.N); do
  rm "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# tmux
for rcfile in ./tmux/*(.N); do
  rm "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# vim
for rcfile in ./vim/*(.N); do
  rm "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

rm -rf "${ZDOTDIR:-$HOME}/.vim/bundle" 

# git
for rcfile in ./git/*(.N); do
  rm "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# ssh
for rcfile in ./ssh/*(.N); do
  rm "${ZDOTDIR:-$HOME}/.ssh/${rcfile:t}"
done
