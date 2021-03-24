#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"


run() {
	local localTmp="$(realpath "$localTmp")"
	local localTarget="$(realpath "$localTarget")"
	local -r boostDir="$localTmp/boost"
	local -r stageDir="$localTmp/stage"
	local -r buildDir="$localTmp/build"
	local -r boostLibDir="$stageDir/lib"

	build_boost

	link_so
}


build_boost() {
	cd "$boostDir"

	git clean -d -f -X
	rm -rdf "$stageDir"
	rm -rdf "$buildDir"
	./bootstrap.sh

	local -r compilerArgs="-fPIC -flto"

	#https://www.boost.org/doc/libs/1_54_0/libs/iostreams/doc/installation.html
	./b2 -q -sNO_BZIP2=1 --jobs="$((3*$(nproc)))" --layout=tagged --toolset=gcc architecture=x86 address-model=64 target-os=linux optimization=speed cflags="$compilerArgs" cxxflags="$compilerArgs" variant=release threading=multi link=static runtime-link=shared --stagedir="$stageDir" --build-dir="$buildDir" variant=release stage

	cd "$scriptDir"
}


link_so() {
	rm -f $boostLibDir/*test*.a

	#Needs a user defined cpp_main function
	rm -f $boostLibDir/libboost_prg_exec_monitor-mt.a

	#ToDo: Fix boost python lib runtime dependency
	rm -f $boostLibDir/*python*.a

	local -r boostLibs=$(find "$boostLibDir" -maxdepth 1 -mindepth 1 -type f)

	echo "linking... (needs some time)"

	g++ -shared -flto -Wl,--start-group -Wl,--whole-archive $boostLibs -Wl,--no-whole-archive -pthread -licuuc -licudata -licui18n -lz -Wl,--end-group \
	-o "$localTarget/libboost.so" \
	-Wl,--as-needed -Wl,--no-undefined -Wl,--no-allow-shlib-undefined
}

run_bash run $@

