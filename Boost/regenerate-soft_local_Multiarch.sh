#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	bash "./boost-setup_local_$currentPlatform.sh"

	./boost-generate-usable-dir_local_Multiarch.sh
}

run_bash run $@

