#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	./clear_local_all.sh

	./boost-download_local_Noarch.sh

	bash "./regenerate-soft_local_$platformLinux.sh"
}

run_bash run $@

