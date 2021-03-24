#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	local -r boostLibDir="$localTmp/boost"

	rm -rdf "$boostLibDir"
	mkdir -p "$boostLibDir"

	#git clone https://github.com/boostorg/boost.git --branch=boost-1.58.0 --depth=1 --recursive --jobs="$((2*$(nproc)))" --shallow-submodules "$boostLibDir"
	
	git clone https://github.com/boostorg/boost.git --branch=boost-1.58.0 --depth=1 --recursive "$boostLibDir"
}

run_bash run $@

