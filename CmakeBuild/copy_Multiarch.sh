#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	local -r tmpDir="../$currentTmp"
	local -r boostTargetDir="$boostDir/$currentTarget"
	local -r targetDir="../$currentTarget"

	mkdir -p "$targetDir"

	cp -L -l "$boostTargetDir"/lib* "$targetDir"
	cp -L -l "$tmpDir"/lib* "$targetDir"
	rm -f "$windowsTarget"/*.dll.a

	cp -L -l "../current_Vicon_source/Vicon/CrossMarket/DataStream/ViconDataStreamSDK_CPP"/*DataStream*Client*.h "$targetDir"

	cp -L -l "../ViconStringTest.h" "$targetDir"
}

run_bash run $@

