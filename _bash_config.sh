#!/bin/bash


run_bash() {
	setupVariables

	# this implements export isolation.
	# exports within the exportIsolation function won't be
	# exported to this outer environment.
	exportIsolation "$@" &
	my_pid=$!
	wait $my_pid
}


setupVariables() {
	readonly unlinkedOwnPath="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
	local -r projectPath="$unlinkedOwnPath"
	# Needed by getRelativeScriptPath
	local -r projectDirName="${projectPath##*/}"

	readonly relativeScriptPath=$(getRelativeScriptPath)
}


getRelativeScriptPath() {
	local -r scriptName="$(basename "$scriptPath")"

	local -r relativeScriptDirList=$(echo $scriptDir| tr '/' '\n')
	local relativeScriptDir=""
	local afterProjectFolder="false"

	for folder in $relativeScriptDirList; do
		if [[ $afterProjectFolder == false ]]; then
			if [[ $folder == $projectDirName ]]; then
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


setupErrorHandling() {
	#add -x for debugging
	set -Eeuo pipefail errexit
	trap on_err ERR INT TERM
}


on_err() {
	errorCode="$?"
	magicNum="22"

	if [[ "$errorCode" -ne "$magicNum" ]] ;then
		echo -e "\nError occurred in: $relativeScriptPath" >&2
		exit "$magicNum"
	fi
}


exportIsolation() {
	setupErrorHandling

	loadProjectConfig

	loggedRunner "$@"
}


loadProjectConfig() {
	source "$unlinkedOwnPath/_project_config.sh"
}


loggedRunner() {
	echo "started: $relativeScriptPath"

	local -r the_run="$@"
	$the_run

	echo "finished: $relativeScriptPath"
}

