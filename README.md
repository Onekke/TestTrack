# Test Track


The following project was created in Unreal Engine 4.20.2.

It contains one map with a test track and some grass, traffic cones, blueprints for rain and changing of a day/night cycle.
![Rain](https://github.com/Onekke/TestTrack/blob/master/screenshots/Screenshot4.png)
![Sun](https://github.com/Onekke/TestTrack/blob/master/screenshots/Screenshot5.png)
![Night](https://github.com/Onekke/TestTrack/blob/master/screenshots/Screenshot7.png)
![Grass](https://github.com/Onekke/TestTrack/blob/master/screenshots/Screenshot6.png)


## Installation

For this project to work properly you will need Unreal Engine 4 and AirSim plugin to be installed on your computer.

### Windows

#### Install Unreal Engine

1. [Download](https://www.unrealengine.com/en-US/download) the Epic Games Launcher. Even thought Unreal Engine is an open source project, registration is still requered.
2. Run the Epic Games Launcher, open the Library tab from left, click on the "Add Versions", which should show the option to download Unreal 4.20.2, and finally click on the "Install" button.


#### Install AirSim

1. For building AirSim you will need [Visual Studio 2017](https://visualstudio.microsoft.com/vs/) (make sure to install VC++ and Windows SDK 8.x).
2. Start `x64 Native Tools Command Prompt for VS 2017`. Create a folder for the repo and run `git clone https://github.com/Microsoft/AirSim.git`.
3. Run `build.cmd` from the command line. This will create ready to use plugin bits in the `Unreal\Plugins` folder.


### Adding AirSim plugin to Unreal project.

1. Go to your folder for AirSim repo and copy `Unreal\Plugins` folder in to your `TestTrack` folder.

2. Right click the `TestTrack.uproject` in Windows Explorer and select `Generate Visual Studio Project Files`. This step detects all plugins and source files in your Unreal project and generates `.sln` file for Visual Studio.

![Screenshot1](https://github.com/Onekke/TestTrack/blob/master/screenshots/Screenshot1.png)

3. Reopen `TestTrack.sln` in Visual Studio, and make sure `DebugGame Editor` and `Win64` build configuration is the active build configuration.

![Screenshot2](https://github.com/Onekke/TestTrack/blob/master/screenshots/Screenshot2.png)

4. Press `F5` to run. This will build your project and start the Unreal Editor.

5. When in Unreal Editor navigate to `World Settings`, which should be on the right side of the Editor window below `World Outliner`.

**Note:** If you do not see it, navigate to `Window` on the menu bar and choose `World Settings` from the list below.
![Screenshot3](https://github.com/Onekke/TestTrack/blob/master/screenshots/Screenshot3.png)

6.  Be sure to `Save` your changes.

**Note:** I do not provide a guide on adding AirSim plugin to Unreal project on Linux since I did not have a good experience with it. Although if you build your project on Windows there should not be any problems migrating it on Linux.


### Linux

Tested on Ubuntu Bionic Beaver (18.04) and Debian Stretch (4.9.88).


#### Prerequisites
- Register to EpicGames following [these instructions]( https://github.com/EpicGames/Signup)
- The scripts provided with UnrealEngine and AirSim will try to install everything you need using apt-get. If an installation fails, then that package may not be present.
  - in particular, `clang-5.0` usually misses. To install it you can add llvm repositories to your `/etc/apt/sources.list` file:
  ```
  # Substitute "stretch" with your distribution name
  # For more info http://apt.llvm.org/llvm
  deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-5.0 main
  deb-src http://apt.llvm.org/stretch/ llvm-toolchain-stretch-5.0 main
  ```
  Then in a terminal:
  ```
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
  sudo apt-get update
  ```


#### Automatic
A script for automatic installation is provided:
1. Run `./install_all.sh where_to_install` (default folder is parent folder of this repository)
2. Cross your fingers and don't go take a coffee cause you will be prompted for sudo password
3. Go take a coffee and wait a lot
4. You will be prompted for sudo password again after compilation of UnrealEngine
5. UnrealEngine will start automatically (after a very long initialization). Go to step 3 of "Adding AirSim plugin to Unreal project" section under "Manual".


#### Manual

##### Install Unreal Engine

Clone Unreal Engine in your favorite folder and build it.

```
# go to the folder where you want to clone the GitHub project

git clone -b 4.20.2-release https://github.com/EpicGames/UnrealEngine.git
cd UnrealEngine
./Setup.sh
./GenerateProjectFiles.sh
make
```

**Note:** The installation and building of the engine might take a while so be patient. :)


##### Install AirSim

Clone AirSim and build it:

```
# go to the folder where you want to clone the GitHub project

git clone https://github.com/Microsoft/AirSim.git
cd AirSim
./setup.sh
./build.sh
```

After all preparations are done you can finally `git clone https://github.com/Onekke/TestTrack.git` in your command line or using [GitHub Desktop](https://desktop.github.com/).


##### Adding AirSim plugin to Unreal project

1. Copy `AirSim/Unreal/Plugins` folder into your `TestTrack` folder.

2. Open UE4Editor (`UnrealEngine/Engine/Binary/Linux/UE4Editor`).

3. After it has successfully opened (it takes a while), go to Projects tab, click on "Browse..." button on bottom right corner and choose the file `TestTrack.uproject`.

4. When in Unreal Editor, navigate to `World Settings`, which should be on the right side of the Editor window below `World Outliner`.

**Note:** If you do not see it, navigate to `Window` on the menu bar and choose `World Settings` from the list below.
![Screenshot3](https://github.com/Onekke/TestTrack/blob/master/screenshots/Screenshot3.png)

5.  Be sure to `Save` your changes.


#### Common issues
These are some (of the many) issues I encountered while installing everything.


##### Toolchain not found in UnrealEngine/GenerateProjectFiles.sh
To solve this problem, try deleting it and trying again.
```
rm -r UnrealEngine/Engine/Extras/ThirdPartyNotUE/SDKs/HostLinux
TestTrack/install_all.sh
```

##### UE4Editor crashes at startup
Check thay `$DISPLAY` environment variable is correctly set and that `OpenGL` is correctly installed.


##### clang-5.0 not found
You didn't read the prerequisites, did you?


## Some tips about the project.

1. While creating the project in Unreal Engine I followed the [Unreal Assets Naming Convention](https://wiki.unrealengine.com/Assets_Naming_Convention), so getting around it should be pretty straight forward.
2. When in Unreal Editor you will always see an empty new level at start, navigate to `Maps/TestMaps` and doubleclick `TestTrack` this will load the map with a test track and everything else set and ready to play around with.
3. As default day/night cycle is set to be changed in a very short period of time. To change that or use system time instead click on `Edit BP_Day_Night_Cycle` in `World Outliner`, then change `New Rate` value in `Set Play Rate` or follow the comments in the blueprint to set the system time in use.
4. To activate/diactivate rain press `G` while in `Play mode` or navigate to `Blueprints > Open Level Blueprint` to make any changes you want.
5. While in `Play` press `F1` to toggle `Help` screen from AirSim plugin for some usefull shortcuts.
6. To activate/deactivate day/night cycle press `T` while in `Play mode`. That will trigger cycle to start from the noon or stop at time set to 12:00am. In case you want to change that time setting navigate to `Edit BP_Day_Night_Cycle` in `World Outliner` and change `Set` node `NewTime` to new value.
