#!/bin/bash

scriptPath="$(realpath -s "${BASH_SOURCE[0]}")"
scriptDir="$(dirname "$scriptPath")"
cd "$scriptDir"

source "./_bash_config.sh"

run() {
	clearCurrentPlatform

	cp -L -l -r -T "$viconDir/$currentTarget" "$currentTarget"

	rm -f "$windowsTarget"/*.dll.a

	setSuccessToken
}

run_bash run $@

