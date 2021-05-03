#!/bin/bash


###########################
#needed by ./bash_config.sh
readonly projectDir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
readonly projectFolderName="${projectDir##*/}"
###########################


#Project Constants
###########################
readonly localTarget="./target"
readonly linuxTarget="$localTarget/Linux64"
readonly windowsTarget="$localTarget/Windows64"

readonly localTmp="$localTarget/_tmp"
readonly noarchTmp="$localTmp/Noarch"
readonly linuxTmp="$localTmp/Linux64"
readonly windowsTmp="$localTmp/Windows64"


#Project Variables
###########################
readonly boostVersion="boost-1.58.0"

