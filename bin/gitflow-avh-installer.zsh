#!/usr/bin/env zsh

wget --no-check-certificate -q  https://raw.github.com/petervanderdoes/gitflow/develop/contrib/gitflow-installer.sh
sudo bash gitflow-installer.sh install stable
rm -f gitflow-installer.sh

exit 0
