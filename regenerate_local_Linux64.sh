#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	rm -dfr $localTarget
	mkdir -p $localTarget
	cp -L -l -r -T $ViconDir/$localTarget $localTarget
}

run_bash run $@

