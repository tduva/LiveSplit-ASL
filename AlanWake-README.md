# Alan Wake Autosplitter & Load Remover

This is still kind of new and experimental. If it doesn't work for you, feel free to open an Issue. This has been tested with the current Steam version.

## Usage

The Autosplitter should automatically start the timer when you start a new game (if the timer is not already running). It will split at the start of every level that is in the Episodes-menu. Your splits have to match this.

You'll have to manually reset your timer as well as split the end of the game, since the Autosplitter can't detect that yet.

This will also remove loads. Switch to Game Time in LiveSplit to see the timer pause when the game loads (Right-click on LiveSplit -> Compare Against -> Game Time).

The Autosplitter reads a level id from the game's memory that changes on every level (value in parentheses):

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
	
For some reason the value makes a bit of a jump (5 -> 9) on the change to Episode 3. But that shouldn't really matter for the Autosplitter. Just set up a split for each level as shown above (without the Episodes, those are just there for structure).

## More Information

* Read the [Livesplit Autosplitter Documentation](https://github.com/LiveSplit/LiveSplit/blob/master/Documentation/Auto-Splitters.md) for information on how Autosplitter scripts work
