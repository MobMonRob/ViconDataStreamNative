#!/bin/bash

scriptDir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
cd "$scriptDir"

../clear_local_all.sh

cd ../current_Linux64_source
make ViconDataStreamSDK_CPP --jobs="$((2*"$(nproc)"))" CONFIG=Release
cd "$scriptDir"

mkdir -p "../target/Linux64/"

cp -L -l ../current_Linux64_source/bin/Release/libViconDataStreamSDK_CPP.so ../target/Linux64/

cp -L -l ../current_Linux64_source/Vicon/CrossMarket/DataStream/ViconDataStreamSDK_CPP/*DataStream*Client*.h ../target/Linux64/

cp -L -l ../current_Linux64_source/thirdparty/Boost/*/installed/lib/libboost_system-mt.so.* ../target/Linux64/

cp -L -l ../current_Linux64_source/thirdparty/Boost/*/installed/lib/libboost_thread-mt.so.* ../target/Linux64/

cp -l ../ViconStringTest.h ../target/Linux64/

echo "ViconDataStreamSDK regenerated"

