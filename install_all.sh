#! /bin/bash

# get path of current script: https://stackoverflow.com/a/39340259/207661
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "$SCRIPT_DIR"  >/dev/null

set -e
set -x

#confirm unreal install directory
ParentDir=$1
if [[ !(-z "UnrealDir") ]]; then
	ParentDir="$SCRIPT_DIR/.."
fi

UnrealDir="$ParentDir/UnrealEngine"
AirSimDir="$ParentDir/AirSim"

read -p "Unreal will be installed in $UnrealDir, AirSim will be installed in $AirSimDir. To change it invoke script with base folder path argument. Continue? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	popd >/dev/null
    exit 0
fi

#install unreal
if [[ !(-d "$UnrealDir") ]]; then
	git clone -b 4.20.2-release https://github.com/EpicGames/UnrealEngine.git "$UnrealDir"
	pushd "$UnrealDir" >/dev/null

	./Setup.sh
	./GenerateProjectFiles.sh
	make

	popd >/dev/null
fi

#install airsim
if [[ !(-d "$AirSimDir") ]]; then
    git clone https://github.com/Microsoft/AirSim.git "$AirSimDir"
	pushd "$AirSimDir" >/dev/null

	./setup.sh
	./build.sh
	
    popd >/dev/null
fi

# Copy files to Project directory
rsync -a --delete "$AirSimDir/Unreal/Plugins" "$SCRIPT_DIR"
echo "Plugin copyed to Project folder"

#start Unreal editor
pushd "$UnrealDir" >/dev/null
Engine/Binaries/Linux/UE4Editor 
popd >/dev/null

popd >/dev/null
