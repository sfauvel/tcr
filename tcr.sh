#!/bin/bash

SOUND_PATH=$(pwd)/sound
RED='\033[0;31m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m' # No Color

write_failure() {
  echo -e "${RED}$1${NO_COLOR}"
}

write_success() {
  echo -e "${GREEN}$1${NO_COLOR}"
}


function play_sound() {
    local SOUND_FILE=$1
    aplay ${SOUND_PATH}/${SOUND_FILE} >/dev/null 2>&1
}

# Add all files and commit them.
function sucess() {
    echo -e "${GREEN}\n-----------------------\nTests passed, commit...\n-----------------------"
    git add --all
    git commit -am working
    play_sound SoundBible.com-1884170640.wav
    echo -e "${NO_COLOR}"
    return 0
}

# Revert changes using checkout HEAD
function fail() {
    SRC=.
    echo -e "${RED}\n-----------------------\nTests failed, revert...\n-----------------------"
    git checkout HEAD -- ${SRC}    
    play_sound Glass_Break-stephan_schutze-958181291.wav
    echo -e "${NO_COLOR}"
    return 0
}

# Run test and execute `sucess` when tests worked or `fail` when tests failed.
#bash run_test.sh && sucess || fail

if [[ -z "$1" ]]
then
    PROJECT_PATH=.
else 
    PROJECT_PATH=$1
fi

pushd "$PROJECT_PATH"
bash run_test.sh && sucess || fail
popd
