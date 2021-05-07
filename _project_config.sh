#!/bin/bash


###########################
#needed by ./bash_config.sh
readonly projectDir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
readonly projectFolderName="${projectDir##*/}"
###########################


#Project Constants
###########################
readonly platformWindows="Windows64"
readonly platformLinux="Linux64"

readonly localTarget="./target"
readonly linuxTarget="$localTarget/$platformLinux"
readonly windowsTarget="$localTarget/$platformWindows"

readonly localTmp="$localTarget/_tmp"
readonly noarchTmp="$localTmp/Noarch"
readonly linuxTmp="$localTmp/$platformLinux"
readonly windowsTmp="$localTmp/$platformWindows"


#Project Variables
###########################
readonly boostVersion="boost-1.58.0"

CurrentPlatform="$platformWindows"

