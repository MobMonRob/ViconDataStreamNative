#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	./clear_local_all.sh

	./download-boost_local_Linux64.sh

	./regenerate-soft_local_Linux64.sh
}

run_bash run $@

