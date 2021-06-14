#!/bin/bash


readonly projectDir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
readonly boostDir="$projectDir/_dependencies/CustomBoostBuild"
readonly mingwLibPath1="/usr/x86_64-w64-mingw32/lib"
readonly mingwLibPath2="/usr/lib/gcc/x86_64-w64-mingw32/7.3-posix"

