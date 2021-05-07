#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	# Dependencies beforehand

	# We usually don't want to redownload boost.
	# Use ./clear_local_all.sh manually instead if necessary.
	if [[ ! -d "$linuxTmp/boost" ]]; then
		bash "./regenerate_local_$platformLinux.sh"
	else
		bash "./regenerate-soft_local_$platformLinux.sh"
	fi
}

run_bash run $@

