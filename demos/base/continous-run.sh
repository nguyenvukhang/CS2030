#!/usr/bin/env bash

ENTRYPOINT=Main

mkdir -p @/cache

# ANSI color codes to print colors to stdout
GREEN='\033[0;32m'
GRAY='\033[0;37m'
RESET='\033[0m'

cleanup() {
  rm -rf @/cache 2>/dev/null
}
trap cleanup EXIT # run `cleanup` upon exit

PREV_SHA=
CURR_SHA=

clear
while [ true ]; do
  [ -d @/cache ] || mkdir @/cache
  # clear cache
  rm -f @/cache/*
  # copy all files that end with .java or .in into @/cache
  cp *.java *.in @/cache 2>/dev/null
  if [ $? != 0 ]; then
    sleep 1
    continue
  fi
  # make one giant file that contains lines from all other files
  cat @/cache/* >@/cache/all.txt
  # generate a checksum on that file
  CURR_SHA=$(shasum @/cache/all.txt)

  # guard close 101:
  # if current state is the same as the previous state, then sleep
  # for 1 second and continue the loop
  if [[ "$CURR_SHA" == "$PREV_SHA" ]]; then
    sleep 1
    continue
  fi

  # execution only reaches here if changes are detected.

  clear              # clear the screen
  PREV_SHA=$CURR_SHA # update the new cache key

  printf $GRAY
  ls *.java
  printf $RESET
  printf "${GREEN}Fresh compile!${GRAY} $(date +'%H:%M:%S')\n${RESET}"

  javac -Xlint:unchecked *.java

  # start Java execution from the `Main` class, and make it take in
  # a file passed as the first argument to this script, if it exists
  if [ -z $1 ] || [ ! -f $1 ]; then
    java $ENTRYPOINT <1.in
  else
    java $ENTRYPOINT <$1
  fi
  rm *.class 2>/dev/null

  sleep 1
done
