#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	local -r tmpDir="../$currentTmp"
	mkdir -p "$tmpDir"
	cd "$tmpDir"

	cmake ../../../CmakeBuild/
	#make --jobs=1
	make --jobs="$((2*$(nproc)))"

	cd "$scriptDir"
}

run_bash run $@

