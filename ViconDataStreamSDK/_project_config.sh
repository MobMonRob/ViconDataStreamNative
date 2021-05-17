#!/bin/bash

readonly projectDir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
readonly viconDir="$projectDir"
readonly boostDir="$projectDir/../Boost"

