state("gta_sa") {
	int playingTime : 0x77CB84;
	int pedStatus : 0x77CD98, 0x530;
	int loading : 0x7A67A5;
	int started : 0x77CEDC;
	byte menu : 0x7A68A5;
	int menuItem : 0x7A679C;
	float onFoot : 0x77938C;
}

init {
	/*
	 * Add splits not to split to this list.
	 */
	vars.blacklist = new List<string> {
		//"Bustedwarp Badlands 1",
		//"Deathwarp Badlands 1",
		"Running Dog"
	};

	/*
	 * Memory address and the associated values and missions. Each
	 * mission is only split once from the start of the timer.
	 *
	 * Commenting out missions may interfere with custom splits that
	 * refer to their status.
	 */
	vars.missions = new Dictionary<int, Dictionary<int, string>> {
		{0xA4A060, new Dictionary<int, string> { // INTRO
			{1, "Big Smoke"},
			{2, "Ryder"}
		}},
		{0xA4A070, new Dictionary<int, string> { // SWEET
			{1, "Tagging up Turf"},
			{2, "Cleaning the Hood"},
			{3, "Drive-Thru"},
			{4, "Nines and AKs"},
			{5, "Drive-By"},
			{6, "Sweet's Girl"},
			{7, "Cesar Vialpando"},
			{8, "Doberman"},
			{9, "Los Sepulcros"}
		}},
		{0xA4A078, new Dictionary<int, string> { // SMOKE
			{1, "OG Loc"},
			{2, "Running Dog"},
			{3, "Wrong Side of the Tracks"},
			{4, "Just Business"}
		}},
		{0xA4A074, new Dictionary<int, string> { // RYDER
			{1, "Home Invasion"},
			{2, "Catalyst"},
			{3, "Robbing Uncle Sam"}
		}},
		{0xA4A088, new Dictionary<int, string> { // LS_FINAL
			{1, "Reuniting the Families"},
			{2, "The Green Sabre"}
		}},
		{0xA4A080, new Dictionary<int, string> { // CRASH_LS
			{1, "Burning Desire"},
			{2, "Gray Imports"}
		}},
		{0xA4A07C, new Dictionary<int, string> { // OG_LOC
			{1, "Life's a Beach"},
			{2, "Madd Dogg's Rhymes"},
			{3, "Management Issues"},
			{4, "House Party (Cutscene)"},
			{5, "House Party"}
		}},
		{0xA4A114, new Dictionary<int, string> {
			{1, "Badlands"}
		}},
		{0xA4A490, new Dictionary<int, string> {
			{1, "Tanker Commander"}
		}},
		{0xA4A48C, new Dictionary<int, string> {
			{1, "Small Town Bank"}
		}},
		{0xA4A488, new Dictionary<int, string> {
			{1, "Local Liquor Store"}
		}},
		{0xA4A494, new Dictionary<int, string> {
			{1, "Against All Odds"}
		}},
		{0xA4BB2C, new Dictionary<int, string> {
			{1, "King in Exile"}
		}},
		{0xA4A10C, new Dictionary<int, string> { // TRUTH
			{1, "Body Harvest"},
			{2, "Are You Going To San Fierro?"}
		}},
		{0xA4BDC8, new Dictionary<int, string> { // RACES_WON_NUMBER
			{2, "Wu Zi Mu"},
			{3, "Farewell, My Love"}
		}},
	};

	Action<string> DebugOutput = (text) => {
		print("[GTASA Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;

	int offset = -0x400000;

	
	// State keeping
	vars.split = new List<string>();
	vars.PrevPhase = null;

	// Watched memory values
	vars.watchers = new MemoryWatcherList();
	foreach (var item in vars.missions) {
		vars.watchers.Add(
			new MemoryWatcher<int>(
				new DeepPointer(item.Key+offset)
			) { Name = item.Key.ToString() }
		);
	}
	vars.watchers.UpdateAll(game);

	// Utility Functions

	/*
	 * Check if the given mission (the name has to be exact) has
	 * already been passed, based on the current memory value.
	 * 
	 * Returns true if the mission should already have been passed,
	 * false otherwise.
	 */
	Func<string, bool> MissionPassed = m => {
		foreach (var item in vars.missions) {
			foreach (var item2 in item.Value) {
				if (item2.Value == m) {
					int currentValue = vars.watchers[item.Key.ToString()].Current;
					DebugOutput(m+" "+item2.Key.ToString()+" >= "+currentValue);
					return currentValue >= item2.Key;
				}
			}
		}
		DebugOutput(m);
		return false;
	};
	vars.Passed = MissionPassed;

	/*
	 * Check if splitting should occur based on whether this split
	 * has already been split since the timer started.
	 * 
	 * If checkOther is true, the vars.other list must contain this
	 * split so the split can occur.
	 *
	 * If this returns true (the split should occur), the split
	 * is also added to the list of already split splits. (Kappab)
	 */
	Func<string, bool> TrySplit = (splitId) => {
		if (vars.blacklist.Contains(splitId)) {
			return false;
		}
		if (!vars.split.Contains(splitId)) {
			vars.split.Add(splitId);
			DebugOutput("Split: "+splitId);
			return true;
		}
		return false;
	};
	vars.TrySplit = TrySplit;

	

/*
	vars.advanced = new Dictionary<string, Func<bool>> {
		{"Bustedwarp 1", () => {
			return true;
		}}
	};
*/

	refreshRate = 30;
	DebugOutput("Initialized");

	// Test
	//print(MissionPassed("Tanker Commander").ToString());
}


update {
	if (timer.CurrentPhase != vars.PrevPhase) {
		if (timer.CurrentPhase == TimerPhase.NotRunning) {
			vars.split.Clear();
			vars.DebugOutput("Cleared");
		}
		vars.PrevPhase = timer.CurrentPhase;
	}
}

split {
	vars.watchers.UpdateAll(game);
	if (current.loading == 1) {
		vars.DebugOutput("Loading");
		return false;
	}
	if (current.started != old.started) {
		vars.DebugOutput("started:"+current.started);
	}
	// This doesn't seem to work for this since it apparently sometimes changes in game to 0
	// (e.g. in the Pizza Place during Ryder, it sometimes stays 0 up until after the mission)
	//if (current.started == 0) {
	//	return false;
	//}

	foreach (var item in vars.missions) {
		int currentValue = vars.watchers[item.Key.ToString()].Current;
		int oldValue = vars.watchers[item.Key.ToString()].Old;
		if (currentValue > oldValue && item.Value.ContainsKey(currentValue)) {
			string splitId = item.Value[currentValue];
			if (vars.TrySplit(splitId)) {
				return true;
			}
		}
	}

	// Busted/Deathwarp
	if (current.pedStatus != old.pedStatus) {
		print(current.pedStatus.ToString());
		if (current.pedStatus == 63) // Busted
		{
			if (vars.Passed("Badlands") && !vars.Passed("Tanker Commander"))
			{
				return vars.TrySplit("Bustedwarp Badlands 1");
			}
			else if (vars.Passed("King in Exile") && !vars.Passed("Small Town Bank"))
			{
				return vars.TrySplit("Bustedwarp Badlands 2");
			}
		}
		if (current.pedStatus == 55) // Wasted
		{
			if (vars.Passed("Tanker Commander") && !vars.Passed("Body Harvest"))
			{
				return vars.TrySplit("Deathwarp Badlands 1");
			}
			else if (vars.Passed("Body Harvest") && !vars.Passed("King in Exile"))
			{
				return vars.TrySplit("Deathwarp Badlands 2");
			}
		}
	}
}
start {
	if (current.menu != 6) {
		return false;
	}
	if (current.playingTime > 30000) {
		return false;
	}
/*
	if (current.menuItem == 2 && current.started == 2 && old.started == 1) {
		vars.DebugOutput("New Game");
		return true;
	} else if (current.menuItem == 0 && current.started == 1 && old.started == 0) {
		vars.DebugOutput("New Game (fresh start)");
		return true;
	}
*/
	if (current.playingTime > 3000 && current.started > old.started) {
		vars.DebugOutput("New Game");
		return true;
	}
}
reset {

	if (current.playingTime > 500 && current.playingTime < 1000) {
		vars.DebugOutput("Reset");
		return true;
	}
/*
	if (current.onFoot < 1 && current.onFoot > 0) {
		vars.DebugOutput("Reset");
		return true;
	}
*/
}

