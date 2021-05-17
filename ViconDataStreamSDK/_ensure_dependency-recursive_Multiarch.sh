#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	if [ ! -d "$currentTarget" ]
	then
		$boostDir/_ensure_dependency-recursive_Multiarch.sh

		./_regenerate_local_Multiarch.sh
	fi
}

run_bash run $@

