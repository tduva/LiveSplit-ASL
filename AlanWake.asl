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
state("AlanWake")
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

	// Seems to contain the filename of the next video to be loaded
	string10 nextVideo : 0x369F30;

	// Seems to be 0 when video is active (works for the last one at least)
	byte notVideo : 0x2C0958;
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
	settings.Add("episode1", true, "Episode 1");
	settings.Add("level1", true, "A Writer's Dream", "episode1");
	settings.Add("level2", true, "Welcome to Bright Falls", "episode1");
	settings.Add("level3", true, "Waking up to a Nightmare", "episode1");

	settings.Add("episode2", true, "Episode 2");
	settings.Add("level4", true, "Bright Falls Sheriff's Station", "episode2");
	settings.Add("level5", true, "Elderwood National Park", "episode2");

	settings.Add("episode3", true, "Episode 3");
	// Level ID makes a jump here
	settings.Add("level9", true, "On the Run", "episode3");
	settings.Add("level10", true, "Mirror Peak", "episode3");

	settings.Add("episode4", true, "Episode 4");
	settings.Add("level11", true, "Cauldron Lake Lodge", "episode4");
	settings.Add("level12", true, "The Anderson Farm", "episode4");
	settings.Add("level13", true, "The Night It All Began", "episode4");

	settings.Add("episode5", true, "Episode 5");
	settings.Add("level14", true, "Night Life in Bright Falls", "episode5");
	settings.Add("level15", true, "Bright Falls Light & Power", "episode5");

	settings.Add("episode6", true, "Episode 6");
	settings.Add("level16", true, "On the Road to Cauldron Lake", "episode6");
	settings.Add("any%", true, "The Dark Place (End of Any%) [experimental]", "episode6");
	settings.SetToolTip("any%", @"This will split when the last cutscene becomes visible (about 0.5s after it starts),
which is equivalent to the manual Any% split.");

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

	vars.endCutsceneStarted = -1;
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
		version = "Steam v1.06";
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
	/*
	 * This Action is special, because if you explicitly return false from it
	 * the other Timer Control Actions (start, reset, split, ..) won't be run.
	 *
	 * In this case this is used to disable the Autosplitter for unknown game
	 * versions.
	 */
	if (version == "")
		return false;

	/*
	 * If a video has just started, and the next video to load is the last
	 * cutscene, save the current time, so that it can split about half a
	 * second later (when the first frame of the cutscene comes up).
	 */
	if (old.notVideo == 1 && current.notVideo == 0 && current.nextVideo == "cine_17300") {
		vars.endCutsceneStarted = Environment.TickCount;
	}
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
	if (old.level == 0)
	{
		// Game starting
		return;
	}
	if (current.level == old.level+1 || current.level == 9 && old.level == 5)
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
	if (vars.endCutsceneStarted > 0 && settings["any%"]) {
		var timePassed = Environment.TickCount - vars.endCutsceneStarted;
		/*
		 * Check that enough time has passed since the last cutscene started,
		 * but also don't allow split if too much time has passed, just as
		 * a safeguard against it splitting later or whatever (e.g. if the
		 * timer is stopped before it splits and then started again).
		 *
		 * This usually seems to split at around the second visible frame of
		 * the cutscene (rather split a frame too late than too early). Either
		 * way, this should be close enough and more accurate than splitting
		 * manually.
		 */
		if (timePassed > 530 && timePassed < 1000) {
			vars.endCutsceneStarted = -1;
			return true;
		}
	}
}

isLoading
{
	return current.isLoading;
}


