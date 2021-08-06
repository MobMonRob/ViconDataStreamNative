## Description
Builds the [Vicon DataStream SDK](https://www.vicon.com/software/datastream-sdk/?section=downloads).

The source code in the folder referenced by the link `current_Vicon_source` is copied from the [Vicon DataStream SDK 1.10.0](https://www.vicon.com/software/datastream-sdk/?section=downloads) which is licensed under an MIT license regarding to their website. [Wayback Machine Link](https://web.archive.org/web/20210125075752/https://www.vicon.com/software/datastream-sdk/?section=downloads)

Supported target systems: Linux x86-64, Windows x86-64 (via preconfigured cross-compilation) \
Supported build systems: Linux

Part of the [JViconDataStream2](https://github.com/MobMonRob/JViconDataStream2) project. There you can find more information how to use ViconDataStreamNative.


## Tested prerequisites
* Kubuntu 18.04 x64
* git 2.17.1: `sudo apt install git`
* (optional) dolphin git integration: `sudo apt install dolphin-plugins`
* g++ 7.5.0: `sudo apt install build-essential`
* g++-mingw-w64-x86-64 7.3.0: `sudo apt install mingw-w64 mingw-w64-tools`


## Prepare build
Clone [CustomBoostBuild](https://github.com/MobMonRob/CustomBoostBuild) into the same directory as ViconDataStreamNative.


## How to build
Run `_ensure_dependency-recursive_Multiarch.sh` in a terminal.


## How to switch the target OS?
**Local build** \
Change the `standardPlatform` variable in the `_platform_config.sh` file.

**In a script** \
Use `changePlatformTo "$platformLinux"` or `changePlatformTo "$platformWindows"` and then run `_ensure_dependency-recursive_Multiarch.sh`.

