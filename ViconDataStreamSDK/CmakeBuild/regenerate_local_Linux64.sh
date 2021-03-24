#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	../clear_local_all.sh

	local -r tmpDir="../$localTmp"

	build
	copy
}


build() {
	mkdir -p "$tmpDir"
	cd "$tmpDir"

	cmake ../../../CmakeBuild/
	make --jobs="$((2*$(nproc)))"

	cd "$scriptDir"
}


copy() {
	local -r boostTargetDir="$BoostDir/$localTarget"
	local -r targetDir="../$localTarget"

	mkdir -p "$targetDir"

	cp -L -l $boostTargetDir/lib* $targetDir
	cp -L -l $tmpDir/lib* $targetDir

	cp -L -l ../current_Linux64_source/Vicon/CrossMarket/DataStream/ViconDataStreamSDK_CPP/*DataStream*Client*.h $targetDir

	cp -L -l ../ViconStringTest.h $targetDir
}

run_bash run $@

