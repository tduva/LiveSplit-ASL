state("AlanWake")
{
	bool isLoading : 0x0036BA34;
	byte level : 0x36D8B4, 0x3F0, 0x174;
}

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
	settings.SetToolTip("level16", @"This does not split the end of the game, it splits at the start of 'The Dark Place'.
 You'll have to split manually at the end of the run for now.");

	Action<string> DebugOutput = (text) => {
		print("[AlanWake Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;
}

init
{
	int moduleSize = modules.First().ModuleMemorySize;
	if (moduleSize == 3805184)
	{
		version = "Steam v1.06";
	}
}

exit
{
	timer.IsGameTimePaused = true;
}

update
{
	// Disable if version not detected
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
}

isLoading
{
	return current.isLoading;
}


