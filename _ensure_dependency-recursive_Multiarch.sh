#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	if [[ "$(isSuccessTokenSet)" == "false" ]]; then
		$viconDir/_ensure_dependency-recursive_Multiarch.sh

		./_regenerate_local_Multiarch.sh
	fi
}

run_bash run $@

