# Alan Wake Autosplitter & Load Remover

This has been tested with the current Steam version. Let me know if you have any issues or questions, for example by opening an Issue or asking in the [Alan Wake Speedrunning Forum](https://www.speedrun.com/aw/forum).

## Installation

Simply enable the Autosplitter in the LiveSplit Splits Editor (while having Alan Wake entered as game).

Otherwise, you can also add it manually: [Download the script](https://raw.githubusercontent.com/tduva/LiveSplit-ASL/master/AlanWake.asl), edit your LiveSplit Layout and add a Scriptable Autosplitter, then edit it's settings and select the downloaded file. Adding it manually can be useful if you want to edit the script yourself.

## Usage

The Autosplitter supports:

* Starting the timer when you start a New Game (if the timer is not already running)
* Splitting at the end of every level that is in the Episodes-menu (at the start of the next level)
  * The last level of the last episode (The Dark Place) is split when the last cutscene becomes visible (End of Any%) [experimental]
  * You can disable splits individually in the settings (e.g. if you only wanted to split the episodes, disable all but the last split per episode)
* Load removal
  * Switch to Game Time in LiveSplit to see the timer pause when the game loads (Right-click on LiveSplit -> Compare Against -> Game Time)

It does not support automatic reset or splitting the Specials right now.

### Splits

If you are using the default Autosplitter settings, you should set up your splits as follows (just the level names, the episodes are just for structure):

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

You can download splits that match these from the [Speedrun.com Resources page](http://www.speedrun.com/aw/resources).

(You don't need the number in parentheses, that is just the level id of that level.)

## More Information

* Read the [Livesplit Autosplitter Documentation](https://github.com/LiveSplit/LiveSplit/blob/master/Documentation/Auto-Splitters.md) for information on how Autosplitter scripts work

## Technical Information
For some reason the value makes a bit of a jump (5 -> 9) on the change to Episode 3. But that shouldn't really matter for the Autosplitter, which simply checks if the value increased. In the future, it might be checked which level is started to allow for some configuration.

There is also another address (string AlanWake.exe+369F30) which contains the filename of the next cutscene, which is being preloaded at some points in the game. This could be used to allow for more splits. It is also used to split at the end of Any%, in combination with an address that is 0 when a video is active (byte AlanWake.exe+2C0958). Since this split would be too early (when the cutscene starts, rather than when it becomes visible), the split is delayed by about 0.5s (usually splits at the second visible frame or so).
