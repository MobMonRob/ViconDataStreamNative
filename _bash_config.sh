#!/bin/bash


run_bash() {
	# this implements export isolation.
	# exports within the exportIsolation function won't be
	# exported to this outer environment.
	exportIsolation $@ &
	wait
}


exportIsolation() {
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

