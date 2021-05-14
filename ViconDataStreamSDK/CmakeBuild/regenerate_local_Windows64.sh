#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	../clear_local_all.sh

	local -r tmpDir="../$currentTmp"

	build
	copy
}


build() {
	mkdir -p "$tmpDir"
	cd "$tmpDir"

	cmake ../../../CmakeBuild/ -DCMAKE_TOOLCHAIN_FILE=../../../CmakeBuild/mingw.cmake
	#make --jobs=1
	make --jobs="$((2*$(nproc)))"

	cd "$scriptDir"
}


copy() {
	local -r boostTargetDir="$boostDir/$currentTarget"
	local -r targetDir="../$currentTarget"

	mkdir -p "$targetDir"

	cp -L -l $boostTargetDir/lib* $targetDir
	cp -L -l $tmpDir/lib* $targetDir

	cp -L -l ../current_Vicon_source/Vicon/CrossMarket/DataStream/ViconDataStreamSDK_CPP/*DataStream*Client*.h $targetDir

	cp -L -l ../ViconStringTest.h $targetDir
}

run_bash run $@

