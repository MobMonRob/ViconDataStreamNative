#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	if [[ ! -d "$localTmp/boost" ]]; then
		# Dependencies here

		./regenerate_local_Linux64.sh

	elif [[ ! -d "$localTarget" ]]; then
		./regenerate-soft_local_Linux64.sh
	fi
}

run_bash run $@

