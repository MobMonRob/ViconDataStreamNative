#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	./_clear_local_all.sh

	./download_Noarch.sh

	./_regenerate-soft_local_Multiarch.sh
}

run_bash run $@

