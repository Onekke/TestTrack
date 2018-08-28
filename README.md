# Test Track


The following project was created in Unreal Engine 4.20.2.
It contains one map with a test track with some grass, traffic cones, blueprints for rain and changing of a day/night cycle.


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
	"EngineAssociation": "4.18",
	"Category": "Samples",
	"Description": "",
	"Modules": [
		{
			"Name": "LandscapeMountains",
			"Type": "Runtime",
			"LoadingPhase": "Default",
			"AdditionalDependencies": [
				"AirSim"
			]
		}
	],
	"TargetPlatforms": [
		"MacNoEditor",
		"WindowsNoEditor"
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
4. Reopen `TestTrack.sln` in Visual Studio, and make sure `DebugGame Editor` and `Win64` build configuration is the active build configuration.
5. Press `F5` to run. This will build your project and start the Unreal Editor.
6. When in Unreal Editor navigate to `World Settings`, which should be on the right side of the Editor window below `World Outliner`.

**Note:** If you do not see it select `Window` from the menu bar and choose `World Settings` from the list below.

7.  Be sure to `Save` your changes.

**Note:** I do not provide a guide on adding AirSim plugin to Unreal project on Linux since I did not have a good experience with it. Although if you build your project on Windows there should not be any problems migrating it on Linux. 
