#!/bin/zsh

function link-files-to-dir() {
  local ORIGIN_DIR=$1
  debug ORIGIN_DIR=$ORIGIN_DIR
  local DESTINATION_DIR=$2
  debug DESTINATION_DIR=$DESTINATION_DIR
  for filename in $ORIGIN_DIR/*(.N);
  do
    link-file $filename $DESTINATION_DIR/${filename:t}
  done
}

function link-hidden-files-to-dir() {
  local ORIGIN_DIR=$1
  debug ORIGIN_DIR=$ORIGIN_DIR
  local DESTINATION_DIR=$2
  debug DESTINATION_DIR=$DESTINATION_DIR
  for filename in $ORIGIN_DIR/*(.N);
  do
    link-file $filename "$DESTINATION_DIR/.${filename:t}"
  done
}

function link-file() {
  local FILE=$1
  local LINK=$2
  debug "ln -s $FILE $LINK"
  ln -s $FILE $LINK
}

function debug() {
  if [[ $DEBUG ]]
  then
    echo "> $*"
  fi
}
