#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	./CMakeBuild/_regenerate_local_Multiarch.sh

	if [[ "$currentPlatform" -eq "$platformWindows" ]]; then
		./copy-mingW-deps_Windows64.sh
	fi
}

run_bash run $@

