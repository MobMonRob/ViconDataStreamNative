#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	if [[ ! -d "$linuxTmp/boost" ]]; then
		# Dependencies here

		bash "./regenerate_local_$platformLinux.sh"

	elif [[ ! -d "$linuxTarget" ]]; then
		bash "./regenerate-soft_local_$platformLinux.sh"
	fi
}

run_bash run $@

