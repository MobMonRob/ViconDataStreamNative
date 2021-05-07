#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	$BoostDir/regenerate_dependency-recursive_Multiarch.sh

	./regenerate_local_Linux64.sh
}

run_bash run $@

