#!/bin/bash


# Constants
###########################
readonly platformWindows="Windows64"
readonly platformLinux="Linux64"
readonly platformNoarch="Noarch"

readonly localTarget="./target"
readonly linuxTarget="$localTarget/$platformLinux"
readonly windowsTarget="$localTarget/$platformWindows"
readonly noarchTarget="$localTarget/$platformNoarch"

readonly localTmp="$localTarget/_tmp"
readonly linuxTmp="$localTmp/$platformLinux"
readonly windowsTmp="$localTmp/$platformWindows"
readonly noarchTmp="$localTmp/$platformNoarch"

setCurrentPlatform() {
	newPlatform="$1"

	if [[ \
		("$newPlatform" != "$platformLinux") && \
		("$newPlatform" != "$platformWindows") && \
		("$newPlatform" != "$platformNoarch") \
	]]; then
		echo "Error: newPlatform=$newPlatform not supported."
		exit 1
	fi

	currentPlatform="$newPlatform"
	# export is needed to pass variable to invoked skripts
	export currentPlatform
	echo "Info: set and exported currentPlatform=$currentPlatform"

	currentTarget="$localTarget/$currentPlatform"
	currentTmp="$localTmp/$currentPlatform"
}

ensurePlatformInitialization() {
	if [[ -z ${currentPlatform+x} ]]; then
	#"CurrentPlatform is unset"
		setCurrentPlatform "$standardPlatform"
	fi
}

readonly standardPlatform="$platformLinux"

ensurePlatformInitialization

