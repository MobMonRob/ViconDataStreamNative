#!/bin/bash


run_bash() {
	loadProjectConfig

	local -r relativeScriptPath=$(getRelativeScriptPath)

	init_bash

	echo "started: $relativeScriptPath"

	local -r the_run="$@"
	$the_run

	echo "finished: $relativeScriptPath"
}


loadProjectConfig() {
	local -r configDir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
	source "$configDir/_project_config.sh"

	if [[ -z ${currentPlatform+x} ]]; then
		#"CurrentPlatform is unset"
		currentPlatform="$currentLocalPlatform"
		export currentPlatform
		echo "currentPlatform was set to $currentPlatform and exported."
	fi

}


getRelativeScriptPath() {
	local -r scriptName="$(basename "$scriptPath")"

	local -r relativeScriptDirList=$(echo $scriptDir| tr '/' '\n')
	local relativeScriptDir=""
	local afterProjectFolder="false"

	for folder in $relativeScriptDirList; do
		if [[ $afterProjectFolder == false ]]; then
			if [[ $folder == $projectFolderName ]]; then
				afterProjectFolder="true"
				relativeScriptDir="."
			fi
			continue
		else
			relativeScriptDir="$relativeScriptDir/$folder"
		fi
	done

	local relativeScriptPath="$relativeScriptDir/$scriptName"

	echo "$relativeScriptPath"
}


init_bash() {
	#add -x for debugging
	set -Eeuo pipefail
	trap on_err ERR INT TERM
}


on_err() {
	echo -e "\nError occurred in: $relativeScriptPath" >&2
	exit 1
}

