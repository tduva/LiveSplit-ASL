/*
 * The state section is required for every script. It defines which process to
 * connect to (without the .exe).
 *
 * Optionally, you can also define one or several states that should be read
 * from the game's memory, which you can then access in other places in the
 * script. This is commonly the way to go for simple scripts.
 *
 * https://github.com/LiveSplit/LiveSplit/blob/master/Documentation/Auto-Splitters.md
 * https://github.com/tduva/LiveSplit-ASL/blob/master/AlanWake-README.md
 */
state("AlanWake", "v1.06.17.0154 (Steam)")
{
	/*
	 * This reads a simple boolean (bool) value from the given address and stores
	 * it under the name "isLoading".
	 */
	bool isLoading : 0x0036BA34;
	
	/*
	 * This does a similiar thing, but uses a pointer path. It reads the value at the
	 * first address (0x36D8B4) and interprets it as another address, then
	 * adds an offset to it (0x3F0) and interprets it's value as another address.
	 * It does this until it reaches the end of the pointer path. The last read
	 * value is interpreted as whatever type is given for this state (in this case a "byte").
	 */
	byte level : 0x36D8B4, 0x3F0, 0x174;

	int video : 0x2C0934, 0x5c8;
}

state("AlanWake", "v1.06.17.0155 (GoG)")
{
	bool isLoading : 0x36CA74;
	byte level : 0x36E618, 0x208;
	int video : 0x2C1974, 0x5c8;
}

state("AlanWake", "v1.05.16.7103 (EGS)")
{
	bool isLoading : 0x36AA74;
	byte level : 0x36C618, 0x208;
	int video : 0x2BF974, 0x5c8;
}

/*
 * This is an Action, which is sort of like a function that is automatically
 * called by the ASL Component. It can interact with other Actions and LiveSplit
 * only by special variables that the environment provides. Inside the function
 * you can write C# code.
 *
 * The "startup" Action is run when the script is first loaded. This is a good
 * place to define things you need in the whole script. This is the only place
 * where you can define settings.
 */
startup
{
	/*
	 * Delay some splits by a certain amount of milliseconds. This currently
	 * only works for videos/any%.
	 */
	vars.delayedSplits = new Dictionary<string,int> {
		{"any%", 530},
		{"video_2500", 450},
		{"video_5700", 2550},
		{"video_9300", 530},
		{"video_12300", 2000},
		{"video_15350", 200},
		{"video_16300", 1000},
		{"video_18700", 1000},
	};

	/*
	 * Checks if the given split id should be delayed, and sets the according
	 * values if so.
	 *
	 * Returns true if the split is to be delayed and should not be split
	 * immediately.
	 */
	Func<string, bool> DelayedSplit = (splitId) => {
		if (vars.delayedSplits.ContainsKey(splitId))
		{
			var delay = vars.delayedSplits[splitId];
			vars.DebugOutput("Delayed split "+splitId+" ("+delay+")");
			vars.delayedSplitTime = Environment.TickCount + delay;
			vars.delayedSplitName = splitId;
			return true;
		}
		else
		{
			vars.DebugOutput("Split "+splitId);
			return false;
		}
	};
	vars.DelayedSplit = DelayedSplit;

	Action<int, string, string, string> AddLevelSplit = (key, name, description, episode) => {
		settings.Add("level"+key, true, name, episode);
		settings.SetToolTip("level"+key, description);
	};

	Action<int, string, string, string> AddVideoSplit = (key, name, description, episode) => {
		var settingKey = "video_"+key;
		settings.Add(settingKey, false, "[Cinematic] "+name, episode);
		settings.SetToolTip(settingKey, description);
	};

	settings.Add("episode1", true, "Episode 1");
	AddLevelSplit(1, "A Writer's Dream", "Splits after entering the lighthouse", "episode1");
	AddVideoSplit(2500, "Diner", "Splits when leaving the Diner", "episode1");
	AddLevelSplit(2, "Welcome to Bright Falls", "Splits after getting back to the cabin", "episode1");
	AddVideoSplit(3300, "Crashed", "Splits when entering the container", "episode1");
	AddLevelSplit(3, "Waking up to a Nightmare", "Splits on the transition to Episode 2", "episode1");

	settings.Add("episode2", true, "Episode 2");
	AddLevelSplit(4, "Bright Falls Sheriff's Station", "Splits after leaving the Station", "episode2");
	AddVideoSplit(5600, "Rusty", "Splits when crashing the cable car", "episode2");
	AddVideoSplit(5700, "Kidnapper", "Splits after Lover's Peak", "episode2");
	AddLevelSplit(5, "Elderwood National Park", "Splits on the transition to Episode 3", "episode2");

	settings.Add("episode3", true, "Episode 3");
	AddVideoSplit(9300, "Rose", "Splits when leaving the trailer park", "episode3");
	AddVideoSplit(9500, "Radio Station", "Splits when leaving the radio station", "episode3");
	// Level ID makes a jump here
	AddLevelSplit(9, "On the Run", "Splits when getting into the car", "episode3");
	AddVideoSplit(10300, "Coalmine (Day)", "Splits when entering the coalmine", "episode3");
	AddLevelSplit(10, "Mirror Peak", "Splits on the transition to Episode 4", "episode3");

	settings.Add("episode4", true, "Episode 4");
	AddVideoSplit(11500, "Hartman", "Splits when entering Hartman's office", "episode4");
	AddLevelSplit(11, "Cauldron Lake Lodge", "Splits after escaping with Barry", "episode4");
	AddVideoSplit(12300, "To the Farm", "Splits when finding Barry on the stage", "episode4");
	AddLevelSplit(12, "The Anderson Farm", "Splits after playing the record", "episode4");
	AddLevelSplit(13, "The Night It All Began", "Splits on the transition to Episode 5", "episode4");

	settings.Add("episode5", true, "Episode 5");
	AddVideoSplit(14300, "Bright Falls 1", "Splits after getting the helicopter keys", "episode5");
	AddLevelSplit(14, "Night Life in Bright Falls", "Splits after getting into the helicopter", "episode5");
	AddVideoSplit(15350, "Lady of the Light", "Splits when entering the water pipe", "episode5");
	AddLevelSplit(15, "Bright Falls Light & Power", "Splits on the transition to Episode 6", "episode5");

	settings.Add("episode6", true, "Episode 6");
	AddVideoSplit(16300, "On the Road (Day)", "Splits at the flash in the first tunnel", "episode6");
	AddVideoSplit(18700, "Bridge/Junkyard", "Splits at the flash in the old town", "episode6");
	AddLevelSplit(16, "On the Road to Cauldron Lake", "Splits after defeating the tornado", "episode6");
	settings.Add("any%", true, "The Dark Place (End of Any%)", "episode6");
	settings.SetToolTip("any%", @"Splits when the last cutscene becomes visible (about 0.5s after it starts),
which is equivalent to the manual Any% split.");

	//settings.Add("video_4100", true, "Test2");

	/*
	 * This defines a function (delegate) for easier output of
	 * debug information. Something like this makes sense when you
	 * have code that is required several times around the script.
	 *
	 * The function is assigned to a local variable, but also assigned to the dynamic
	 * object "vars" so it can be accessed from other Actions.
	 * 
	 * You can assign all kinds of values to "vars" to exchange them between Actions.
	 */
	Action<string> DebugOutput = (text) => {
		print("[AlanWake Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;

	vars.delayedSplitTime = -1;
	vars.delayedSplitName = "";
	vars.prevUpdateTime = -1;
}

/*
 * The "init" Action is called when the script connects to a game process. This
 * is where you can do game-specific initialization like dectecting the game
 * version.
 */
init
{
	/*
	 * Detecting the game version can be useful if your script should either
	 * support different versions of the game or if you want to disable the
	 * script for unknown versions.
	 *
	 * For this, the special variable "modules" is accessed to get the
	 * ModuleMemorySize of the process, which is then checked against the
	 * known size for this version.
	 *
	 * The special "version" variable is set, which can only be done in
	 * the "init" Action. If you had designed a State Descriptor with this
	 * version it would now switch to that State Descriptor. This also has
	 * the effect of displaying the version in the ASL Settings GUI and you
	 * can access the "version" variable from other Actions.
	 *
	 * Note that for simply accessing the version from other Actions, you
	 * could also save the detected version in "vars", for example like this:
	 *
	 * vars.gameVersion = "Steam v1.06";
	 *
	 * However this would *not* have the other effects that setting it to
	 * the special "version" variable has (switching State Descriptor and
	 * showing the version in the GUI).
	 */
	int moduleSize = modules.First().ModuleMemorySize;
	if (moduleSize == 3805184)
	{
		version = "v1.06.17.0154 (Steam)";
	}
	if (moduleSize == 3809280)
	{
		version = "v1.06.17.0155 (GoG)";
	}
	if (moduleSize == 3801088)
	{
		version = "v1.05.16.7103 (EGS)";
	}
}

/*
 * The "exit" Action is called when the process the script is connected to exits.
 *
 * In this example the Game Time is paused while the process is closed, for example
 * in case of a game crash.
 */
exit
{
	timer.IsGameTimePaused = true;
}

/*
 * The "update" Action is called as long as the script is connected to a process.
 * It is a general update Action which can be used to do stuff that should always
 * run independant of the current Timer state.
 */
update
{
	// Debug output
	var timeSinceLastUpdate = Environment.TickCount - vars.prevUpdateTime;
	if (timeSinceLastUpdate > 500 && vars.prevUpdateTime != -1)
	{
		vars.DebugOutput("Last update "+timeSinceLastUpdate+"ms ago");
	}
	vars.prevUpdateTime = Environment.TickCount;


	/*
	 * This Action is special, because if you explicitly return false from it
	 * the other Timer Control Actions (start, reset, split, ..) won't be run.
	 *
	 * In this case this is used to disable the Autosplitter for unknown game
	 * versions.
	 */
	if (version == "")
		return false;
}

start
{
	if (current.isLoading && current.level == 1) {
		vars.DebugOutput("Timer started");
		return true;
	}
}

split
{
	/*
	 * Never split in the first few seconds, since starting an episode could
	 * immediately split under the right circumstances.
	 */
	if (timer.CurrentTime.RealTime < TimeSpan.FromSeconds(4))
	{
		return;
	}

	if (old.level == 0)
	{
		// Game starting
		return;
	}

	/*
	 * Level-based splitting
	 */
	if (current.level == old.level+1 || (current.level == 9 && old.level == 5))
	{
		print(current.level.ToString());
		// Check setting for previous level value, because the split would
		// be for the end of the previous level
		if (settings["level"+old.level])
		{
			vars.DebugOutput("Split Start of Level "+current.level);
			return true;
		}
	}

	/*
	 * Cinematic-based splitting
	 */
	if (current.video > old.video)
	{
		if (settings.ContainsKey("video_"+current.video) && settings["video_"+current.video])
		{
			/*
			 * This "flash" with the same number occurs several times
			 * (e.g. heli fight), but this should only split in the old town
			 * in episode 6. There's also a few more after that in the same
			 * level, but since there are no other videos in between, the
			 * value won't change, so this won't be called.
			 */
			if (current.video == 18700 && current.level != 16)
			{
				return false;
			}
			if (!vars.DelayedSplit("video_"+current.video))
			{
				return true;
			}
		}
		if (settings["any%"] && current.video == 17300)
		{
			vars.DelayedSplit("any%");
		}
	}

	/*
	 * Delayed splitting
	 */
	if (vars.delayedSplitTime > 0) {
		/*
		 * Check that enough time has passed since the last cutscene started,
		 * but also don't allow split if too much time has passed, just as
		 * a safeguard against it splitting later or whatever (e.g. if the
		 * timer is stopped before it splits and then started again).
		 */
		if (Environment.TickCount > vars.delayedSplitTime
			&& Environment.TickCount - 500 < vars.delayedSplitTime)
		{
			vars.delayedSplitTime = -1;
			vars.DebugOutput("Split "+vars.delayedSplitName);
			return true;
		}
	}
}

isLoading
{
	return current.isLoading;
}


