#!/bin/bash


run_bash() {
	# this implements export isolation.
	# exports within the exportIsolation function won't be
	# exported to this outer environment.
	exportIsolation "$@" &
	my_pid=$!
	wait $my_pid
}


exportIsolation() {
	setupVariables
	setupErrorHandling

	loadConfig
	loggedRunner "$@"
}


setupVariables() {
	local -r ownFullPath="$(realpath -s "${BASH_SOURCE[0]}")"
	local -r unlinkedOwnFullPath="$(readlink -f "$ownFullPath")"
	readonly unlinkedOwnDirPath="$(dirname "$unlinkedOwnFullPath")"

	setRelativeScriptPath
}


setRelativeScriptPath() {
	if [[ -z ${firstInvokedSkriptPath+x} ]]; then
		#"CurrentPlatform is unset"
		firstInvokedSkriptPath="$scriptDir"
		# export is needed to pass variable to invoked skripts
		export firstInvokedSkriptPath
		echo "Info: firstInvokedSkriptPath was set to $firstInvokedSkriptPath and exported."
	fi

	local -r scriptName="$(basename "$scriptPath")"

	if [[ "$firstInvokedSkriptPath" == "$scriptDir" ]]; then
		local -r relativeFullPath="./$scriptName"
	else
		local -r relativeDirPath="$(realpath --relative-to="$firstInvokedSkriptPath" "$scriptDir")"
		local -r relativeFullPath="./$relativeDirPath/$scriptName"
	fi

	readonly relativeScriptPath="$relativeFullPath"
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


loadConfig() {
	source "$unlinkedOwnDirPath/_platform_config.sh"
	source "$unlinkedOwnDirPath/_project_config.sh"
}


loggedRunner() {
	if [[ -z ${level+x} ]]; then
		level="1"
		export level
	fi

	echo "---started($level): $relativeScriptPath"

	((level+=1))
	export level

	local -r the_run="$@"
	$the_run

	((level-=1))

	echo "--finished($level): $relativeScriptPath"
}

