#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	bash "./CMakeBuild/regenerate_local_$currentPlatform.sh"

	if [[ "$currentPlatform" -eq "$platformWindows" ]]; then
		./deploy-mingW-deps_local_Windows64.sh
	fi
}

run_bash run $@

