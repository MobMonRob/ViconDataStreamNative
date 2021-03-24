#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	if [ ! -d "$localTarget" ]
	then
		$ViconDir/ensure_dependency-recursive_Linux64.sh

		./regenerate_local_Linux64.sh
	fi
}

run_bash run $@

