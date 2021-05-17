#!/bin/bash


# Platform Constants
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


# Platform Variables
###########################
#set $currentLocalPlatform but don't use it explicitly.
#use $currentPlatform instead. But don't set it.
#$currentLocalPlatform will be used if $currentPlatform is unset.
readonly currentLocalPlatform="$platformWindows"


# Dependent Platform Constants
###########################
if [[ -z ${currentPlatform+x} ]]; then
	#"CurrentPlatform is unset"
	currentPlatform="$currentLocalPlatform"
	# export is needed to pass variable to invoked skripts
	export currentPlatform
	echo "currentPlatform was set to $currentPlatform and exported."
fi
readonly currentTarget="$localTarget/$currentPlatform"
readonly currentTmp="$localTmp/$currentPlatform"


# Project Variables
###########################
readonly projectDir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
readonly viconDir="$projectDir/ViconDataStreamSDK"
readonly boostDir="$projectDir/Boost"
readonly mingwLibPath1="/usr/x86_64-w64-mingw32/lib"
readonly mingwLibPath2="/usr/lib/gcc/x86_64-w64-mingw32/7.3-posix"

