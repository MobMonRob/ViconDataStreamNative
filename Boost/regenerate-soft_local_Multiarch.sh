#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	bash "./boost-setup_local_$currentPlatform.sh"

	if [[ ! -d "$currentTarget/include/boost" ]]; then
		./boost-generate-full-include-dir_local_Multiarch.sh
	else
		echo "Skipped ./boost-generate-full-include-dir_local_Multiarch.sh because $currentTarget/include/boost already exists."
	fi

	if [[ "$currentPlatform" -eq "$platformWindows" ]]; then
		./boost-deploy-mingW-deps_local_Windows64.sh
	fi
}

run_bash run $@

