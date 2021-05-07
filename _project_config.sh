#!/bin/bash


#needed by ./bash_config.sh
###########################
readonly projectDir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
readonly projectFolderName="${projectDir##*/}"
###########################


#Platform Constants
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


#Platform Variables
###########################
#set $currentLocalPlatform but don't use it explicitly.
#use $currentPlatform instead. But don't set it.
#$currentLocalPlatform will be used if $currentPlatform is unset.
readonly currentLocalPlatform="$platformLinux"


#Dependent Platform Constants
###########################
if [[ -z ${currentPlatform+x} ]]; then
	#"CurrentPlatform is unset"
	currentPlatform="$currentLocalPlatform"
	export currentPlatform
	echo "currentPlatform was set to $currentPlatform and exported."
fi
readonly currentTarget="$localTarget/$currentPlatform"
readonly currentTmp="$localTmp/$currentPlatform"


#Platform Variables
###########################
viconDir="$projectDir/ViconDataStreamSDK"
boostDir="$projectDir/Boost"

