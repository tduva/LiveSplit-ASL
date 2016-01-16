# Alan Wake Autosplitter & Load Remover

This is still kind of new and experimental. If it doesn't work for you, feel free to open an Issue. This has been tested with the current Steam version.

## Installation

Simply enable the Autosplitter in the LiveSplit Splits Editor (while having Alan Wake entered as game).

Otherwise, you can also add it manually: [Download the script](https://raw.githubusercontent.com/tduva/LiveSplit-ASL/master/AlanWake.asl), edit your LiveSplit Layout and add a Scriptable Autosplitter, then edit it's settings and select the downloaded file. Adding it manually can be useful if you want to edit the script yourself.

## Usage

The Autosplitter should automatically start the timer when you start a new game (if the timer is not already running). It will split at the start of every level that is in the Episodes-menu. Your splits have to match this.

You'll have to manually reset your timer as well as split the end of the game, since the Autosplitter can't detect that yet.

This will also remove loads. Switch to Game Time in LiveSplit to see the timer pause when the game loads (Right-click on LiveSplit -> Compare Against -> Game Time).

The Autosplitter reads a level id from the game's memory that changes on every level (value in parentheses, just fyi, you can ignore that number if you simply want to use this).

Set up your splits as follows (without the Episodes, those are just for structure):

* Episode 1:
	* A Writer's Dream (1)
	* Welcome to Bright Falls (2)
	* Waking up to a Nightmare (3)
* Episode 2:
	* Bright Falls Sheriff's Station (4)
	* Elderwood National Park (5)
* Episode 3:
	* On the Run (9)
	* Mirror Peak (10)
* Episode 4:
	* Cauldron Lake Lodge (11)
	* The Anderson Farm (12)
	* The Night It All Began (13)
* Episode 5:
	* Night Life in Bright Falls (14)
	* Bright Falls Light & Power (15)
* Episode 6:
	* On the Road to Cauldron Lake (16)
	* The Dark Place (17)

## More Information

* Read the [Livesplit Autosplitter Documentation](https://github.com/LiveSplit/LiveSplit/blob/master/Documentation/Auto-Splitters.md) for information on how Autosplitter scripts work

## Technical Information
For some reason the value makes a bit of a jump (5 -> 9) on the change to Episode 3. But that shouldn't really matter for the Autosplitter, which simply checks if the value increased. In the future, it might be checked which level is started to allow for some configuration.

There is also another address (string AlanWake.exe+369F30) which contains the filename of the next cutscene, which is being preloaded at some points in the game. This could be used to allow for more splits.
