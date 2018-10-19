#!/usr/bin/env zsh

setopt LOCAL_OPTIONS EXTENDED_GLOB
local pwd=${0:a:h}

source $pwd/../functions/core.zsh

# Local

## ctags
link-hidden-files-to-dir $pwd/../ctags ${ZDOTDIR:-$HOME}

## git
link-hidden-files-to-dir $pwd/../git ${ZDOTDIR:-$HOME}

## gnupg
link-files-to-dir $pwd/../gnupg ${ZDOTDIR:-$HOME}/.gnupg

## ssh
mkdir -p ${ZDOTDIR:-$HOME}/.ssh
link-files-to-dir $pwd/../ssh ${ZDOTDIR:-$HOME}/.ssh

## tmux
link-hidden-files-to-dir $pwd/../tmux ${ZDOTDIR:-$HOME}

# Remote

## prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git ${ZDOTDIR:-$HOME}/.zprezto

### docker completion
curl -fLo ${ZDOTDIR:-$HOME}/.zprezto/modules/completion/external/src/_docker 'https://raw.githubusercontent.com/docker/docker/master/contrib/completion/zsh/_docker'

link-hidden-files-to-dir $pwd/../prezto ${ZDOTDIR:-$HOME}

## vim
mkdir -p ${ZDOTDIR:-$HOME}/.vim/local
link-hidden-files-to-dir $pwd/../vim ${ZDOTDIR:-$HOME}

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qa

exit 0
