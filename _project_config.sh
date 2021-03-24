#!/bin/bash


###########################
#needed by ./bash_config.sh
projectDir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
projectFolderName="${projectDir##*/}"
###########################


#Project Definitions
###########################
localTmp="./target/_tmp/Linux64"
localTarget="./target/Linux64"
ViconDir="$projectDir/ViconDataStreamSDK"
BoostDir="$projectDir/Boost"

