#!/bin/bash


# Constants
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


# Variables
###########################
#set $currentLocalPlatform but don't use it explicitly.
#use $currentPlatform instead. But don't set it.
#$currentLocalPlatform will be used if $currentPlatform is unset.
readonly currentLocalPlatform="$platformWindows"


# Dependent Constants
###########################
if [[ -z ${currentPlatform+x} ]]; then
	#"CurrentPlatform is unset"
	currentPlatform="$currentLocalPlatform"
	# export is needed to pass variable to invoked skripts
	export currentPlatform
	echo "Info: currentPlatform was set to $currentPlatform and exported."
fi
readonly currentTarget="$localTarget/$currentPlatform"
readonly currentTmp="$localTmp/$currentPlatform"

