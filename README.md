# Test Track


The following project was created in Unreal Engine 4.20.2.

It contains one map with a test track and some grass, traffic cones, blueprints for rain and changing of a day/night cycle.
![Rain](https://github.com/Onekke/TestTrack/blob/master/screenshots/Screenshot4.png)
![Sun](https://github.com/Onekke/TestTrack/blob/master/screenshots/Screenshot5.png)
![Night](https://github.com/Onekke/TestTrack/blob/master/screenshots/Screenshot7.png)
![Grass](https://github.com/Onekke/TestTrack/blob/master/screenshots/Screenshot6.png)


## Installation


For this project to work properly you will need to have installed Unreal Engine 4 and AirSim plugin.


### Install Unreal Engine


In case you do not have it already installed on your computer follow the steps below.


#### Windows


1. [Download](https://www.unrealengine.com/en-US/download) the Epic Games Launcher. Even thought Unreal Engine is an open source project, registration is still requered.
2. Run the Epic Games Launcher, open the Library tab from left, click on the "Add Versions", which should show the option to download Unreal 4.20.2, and finally click on the "Install" button. 


#### Linux

1. First, make sure you are registered with [Epic Games](https://accounts.unrealengine.com/login?lang=en_US&redirectUrl=https%3A%2F%2Fwww.unrealengine.com%2Fen-US%2Fblog&client_id=43e2dea89b054198a703f6199bee6d5b&noHostRedirect=true). It is requred for getting the source code access for Unreal Engine.
2. Clone Unreal Engine in your favorite folder and build it.

```
# go to the folder where you want to clone the GitHub project

git clone -b 4.18 https://github.com/EpicGames/UnrealEngine.git
cd UnrealEngine
./Setup.sh
./GenerateProjectFiles.sh
make
```
**Note:** The installation and building of the engine might take a while so be patient. :)


### Install AirSim


#### Windows


1. For building AirSim you will need [Visual Studio 2017](https://visualstudio.microsoft.com/vs/) (make sure to install VC++ and Windows SDK 8.x).
2. Start `x64 Native Tools Command Prompt for VS 2017`. Create a folder for the repo and run `git clone https://github.com/Microsoft/AirSim.git`.
3. Run `build.cmd` from the command line. This will create ready to use plugin bits in the `Unreal\Plugins` folder.


#### Linux


1. Clone AirSim and build it:
```
# go to the folder where you want to clone the GitHub project

git clone https://github.com/Microsoft/AirSim.git
cd AirSim
./setup.sh
./build.sh
```


After all preparations are done you can finally `git clone https://github.com/Onekke/TestTrack.git` in your command line or using [GitHub Desctop](https://desktop.github.com/).

## Adding AirSim plugin to Unreal project.


1. Go to your folder for AirSim repo and copy `Unreal\Plugins` folder in to your `TestTrack` folder.
2. Edit the `TestTrack.uproject` so that it looks like this:

```
{
	"FileVersion": 3,
	"EngineAssociation": "4.20",
	"Category": "",
	"Description": "",
	"Enterprise": true,
	"Modules": [
		{
			"Name": "TestTrack",
			"Type": "Runtime",
			"LoadingPhase": "Default",
			"AdditionalDependencies": [
				"AirSim"
			]
		}
	],
	"Plugins": [
		{
			"Name": "AirSim",
			"Enabled": true
		}
	]
}
```

3. Right click the `TestTrack.uproject` in Windows Explorer and select `Generate Visual Studio Project Files`. This step detects all plugins and source files in your Unreal project and generates `.sln` file for Visual Studio.
![Screenshot1](https://github.com/Onekke/TestTrack/blob/master/screenshots/Screenshot1.png)
4. Reopen `TestTrack.sln` in Visual Studio, and make sure `DebugGame Editor` and `Win64` build configuration is the active build configuration.

![Screenshot2](https://github.com/Onekke/TestTrack/blob/master/screenshots/Screenshot2.png)

5. Press `F5` to run. This will build your project and start the Unreal Editor.
6. When in Unreal Editor navigate to `World Settings`, which should be on the right side of the Editor window below `World Outliner`.

**Note:** If you do not see it, navigate to `Window` on the menu bar and choose `World Settings` from the list below.
![Screenshot3](https://github.com/Onekke/TestTrack/blob/master/screenshots/Screenshot3.png)

7.  Be sure to `Save` your changes.

**Note:** I do not provide a guide on adding AirSim plugin to Unreal project on Linux since I did not have a good experience with it. Although if you build your project on Windows there should not be any problems migrating it on Linux. 

## Some tips about the project.

1. While creating the project in Unreal Engine I followed the [Unreal Assets Naming Convention](https://wiki.unrealengine.com/Assets_Naming_Convention), so getting around it should be pretty straight forward.
2. When in Unreal Editor you will always see an empty new level at start, navigate to `Maps/TestMaps` and doubleclick `TestTrack` this will load the map with a test track and everything else set and ready to play around with.
3. As default day/night cycle is set to be changed in a very short period of time. To change that or use system time instead click on `Edit BP_Day_Night_Cycle`in `World Outliner`, then change `New Rate` value in `Set Play Rate` or follow the comments in the blueprint to set the system time in use.
4. To activate/diactivate rain press `G` when in `Play` or navigate to `Blueprints > Open Level Blueprint` to make any changes you want.
5. While in `Play` press `F1` to toggle `Help` screen from AirSim plugin with some usefull shortcuts.
