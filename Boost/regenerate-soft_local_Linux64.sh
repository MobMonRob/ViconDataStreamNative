#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	rm -rdf "$localTarget"
	mkdir -p "$localTarget"

	./setup-boost_local_Linux64.sh

	./generate-usable-boost-dir_local_Linux64.sh
}

run_bash run $@

