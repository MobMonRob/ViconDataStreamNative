#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	../Boost/regenerate_dependency-recursive_Linux64.sh

	./regenerate_local_Linux64.sh
}

run_bash run $@

