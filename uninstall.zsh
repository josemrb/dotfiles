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

