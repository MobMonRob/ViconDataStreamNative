#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	../_clear_local_all.sh

	bash "./build_$currentPlatform.sh"

	./copy_Multiarch.sh
}

run_bash run $@

