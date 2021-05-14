#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	rm -dfr $currentTarget
	mkdir -p $currentTarget
	cp -L -l -r -T $ViconDir/$currentTarget $currentTarget
}

run_bash run $@

