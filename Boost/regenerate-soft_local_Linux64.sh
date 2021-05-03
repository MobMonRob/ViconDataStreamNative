#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	./boost-setup_local_Linux64.sh

	./boost-generate-usable-dir_local_Linux64.sh
}

run_bash run $@

