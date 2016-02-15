state("gta_sa") {
	int version_100_EU : 0x4245BC;
	int version_100_US : 0x42457C;
	int version_101_EU : 0x42533C;
	int version_101_US : 0x4252FC;
	int version_300_Steam : 0x45EC4A;
	int version_101_Steam : 0x45DEDA;
}

state("gta-sa") {
	int version_100_EU : 0x4245BC;
	int version_100_US : 0x42457C;
	int version_101_EU : 0x42533C;
	int version_101_US : 0x4252FC;
	int version_300_Steam : 0x45EC4A;
	int version_101_Steam : 0x45DEDA;
}


init {
	//print(modules.First().ModuleMemorySize.ToString());
	// gta-sa.exe 9981952

	var versionValue = 38079;
	int versionOffset = 0;
	int playingTime = 0xB7CB84;
	int startAddr = 0xB7CEDC;
	int menuAddr = 0xBA68A5;
	int tagsAddr = 0x69AD74;
	int threadAddr = 0xA8B42C;
	print(current.version_100_EU.ToString());

	int moduleSize = modules.First().ModuleMemorySize;
	if (current.version_100_EU == versionValue
		|| current.version_100_US == versionValue
		|| moduleSize == 18313216)
	{
		versionOffset = 0;
		version = "1.0";
	}
	if (current.version_101_EU == versionValue
		|| current.version_101_US == versionValue
		|| moduleSize == 34471936)
	{
		versionOffset = 0x2680;
		version = "1.01";
	}
	if (moduleSize == 17985536)
	{
		versionOffset = 0x2680;
		version = "2.00";
	}
	if (current.version_300_Steam == versionValue
		|| moduleSize == 9691136)
	{
		versionOffset = 0x75130;
		version = "3.00 Steam";
	}
	if (current.version_101_Steam == versionValue)
	{
		versionOffset = 0x75770;
		version = "1.01 Steam";
	}
	if (moduleSize == 9981952) {
		versionOffset = 0x77970;
		version = "Steam";
		playingTime = 0x80FD74;
		startAddr = 0x810214;
		menuAddr = 0x5409BC;
		threadAddr = 0x702D98;
	}
	
	int offset = -0x400000+versionOffset;
	if (version != "Steam") {
		playingTime += offset;
		startAddr += offset;
		menuAddr += offset;
		threadAddr += offset;
	}
	
	/*
	 * Add splits not to split to this list. Lines starting with "//" are comments and not active
	 * in the blacklist (thus those still get split).
	 *
	 * Example:
	 * //"Bustedwarp Badlands 1",	// Commented out, will still split
	 * "End of the Line Part 1",	// Actually on the blacklist, will not split
	 *
	 * Some are in the list but commented out because they might commonly not be wanted.
	 * Otherwise, check out the mission list below for the exact names of missions to add
	 * to the blacklist.
	 */
	vars.blacklist = new List<string> {

		//## Special splits
		//"Bustedwarp Badlands 1",
		//"Bustedwarp Badlands 2",
		//"Deathwarp Badlands 1",
		//"Deathwarp Badlands 2",
		//"Gang Territories #1",	// Start of Grove 4 Life
		//"Gang Territories #2",	// Start of Cut Throat Business
		//"any%",			// End of any%

		//## Commonly not split
		"End of the Line Part 1",
		"End of the Line Part 2",
		"End of the Line Part 3",	// This would be after the credits

		//## yesDuping
		"T-Bone Mendez",
		"Amphibious Assault",
		"Ran Fa Li",

	};
	
	// Don't edit anything beyond this point unless you know what you are doing


	/*
	 * Memory address and the associated values and missions. Each
	 * mission is only split once from the start of the timer.
	 *
	 * Commenting out missions may interfere with custom splits that
	 * refer to their status.
	 */
	vars.missions = new Dictionary<int, Dictionary<int, string>> {
		{0xA4A060, new Dictionary<int, string> { // $INTRO_TOTAL_PASSED_MISSIONS
			{1, "Big Smoke"},
			{2, "Ryder"}
		}},
		{0xA4A070, new Dictionary<int, string> { // $SWEET_TOTAL_PASSED_MISSIONS
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
		{0xA4A078, new Dictionary<int, string> { // $SMOKE_TOTAL_PASSED_MISSIONS
			{1, "OG Loc"},
			{2, "Running Dog"},
			{3, "Wrong Side of the Tracks"},
			{4, "Just Business"}
		}},
		{0xA4A074, new Dictionary<int, string> { // $RYDER_TOTAL_PASSED_MISSIONS
			{1, "Home Invasion"},
			{2, "Catalyst"},
			{3, "Robbing Uncle Sam"}
		}},
		{0xA4A088, new Dictionary<int, string> { // $LS_FINAL_TOTAL_PASSED_MISSIONS
			{1, "Reuniting the Families"},
			{2, "The Green Sabre"}
		}},
		{0xA4A080, new Dictionary<int, string> { // $CRASH_LS_TOTAL_PASSED_MISSIONS
			{1, "Burning Desire"},
			{2, "Gray Imports"}
		}},
		{0xA4A07C, new Dictionary<int, string> { // $OG_LOC_TOTAL_PASSED_MISSIONS
			{1, "Life's a Beach"},
			{2, "Madd Dogg's Rhymes"},
			{3, "Management Issues"},
			{4, "House Party (Cutscene)"},
			{5, "House Party"}
		}},
		{0xA4A084, new Dictionary<int, string> { // $MISSION_LOWRIDER_PASSED
			{1, "High Stakes Lowrider"}
		}}, 
		{0xA4A114, new Dictionary<int, string> { // $MISSION_BADLANDS_PASSED
			{1, "Badlands"}
		}},
		{0xA4A490, new Dictionary<int, string> { // $MISSION_TANKER_COMMANDER_PASSED
			{1, "Tanker Commander"}
		}},
		{0xA4A48C, new Dictionary<int, string> { // $MISSION_SMALL_TOWN_BANK_PASSED
			{1, "Small Town Bank"}
		}},
		{0xA4A488, new Dictionary<int, string> { // $MISSION_LOCAL_LIQUOR_STORE_PASSED
			{1, "Local Liquor Store"}
		}},
		{0xA4A494, new Dictionary<int, string> { // $ALL_CATALINA_MISSIONS_PASSED (not aptly named variable)
			{1, "Against All Odds"}
		}},
		{0xA4BB2C, new Dictionary<int, string> { // $2163
			{1, "King in Exile"}
		}},
		{0xA4A10C, new Dictionary<int, string> { // $TRUTH_TOTAL_PASSED_MISSIONS
			{1, "Body Harvest"},
			{2, "Are You Going To San Fierro?"}
		}},
		{0xA4BDC8, new Dictionary<int, string> { // $RACES_WON_NUMBER
			{2, "Wu Zi Mu"},
			{3, "Farewell, My Love"}
		}},
		{0xA4A1D4, new Dictionary<int, string> { // $GARAGE_TOTAL_PASSED_MISSIONS
			{1, "Wear Flowers in your Hair"},
			{2, "Deconstruction"}
		}},
		{0xA4A1DC, new Dictionary<int, string> { // $WUZIMU_TOTAL_PASSED_MISSIONS
			{1, "Mountain Cloud Boys"},
			{2, "Ran Fa Li"},
			{3, "Lure"},
			{4, "Amphibious Assault"},
			{5, "The Da Nang Thang"}
		}},
		{0xA4A1E4, new Dictionary<int, string> { // $SYNDICATE_TOTAL_PASSED_MISSIONS
			{1, "Photo Opportunity"},
			{2, "Jizzy (Cutscene)"},
			{3, "Jizzy"},
			{4, "T-Bone Mendez"},
			{5, "Mike Toreno"},
			{6, "Outrider"},
			{7, "Ice Cold Killa"},
			{8, "Pier 69"},
			{9, "Toreno's Last Flight"},
			{10, "Yay Ka-Boom-Boom"}
		}},
		{0xA4A1E8, new Dictionary<int, string> { // $CRASH_SF_TOTAL_PASSED_MISSIONS
			{1, "555 WE TIP"},
			{2, "Snail Trail"}
		}},
		{0xA4A2A4, new Dictionary<int, string> { // $TORENO_TOTAL_PASSED_MISSIONS
			{1, "Monster"},
			{2, "Highjack"},
			{3, "Interdiction"},
			{4, "Verdant Meadows"},
			{5, "Learning to Fly"},
			{6, "N.O.E."},
			{7, "Stowaway"},
			{8, "Black Project"},
			{9, "Green Goo"}
		}},
		{0xA4A2B4, new Dictionary<int, string> { // $CASINO_TOTAL_PASSED_MISSIONS
			{1, "Fender Ketchup"},
			{2, "Explosive Situation"},
			{3, "You've Had Your Chips"},
			{4, "Don Peyote"},
			{5, "Intensive Care"},
			{6, "The Meat Business"},
			{7, "Fish in a Barrel"},
			{8, "Freefall"},
			{9, "Saint Mark's Bistro"}
		}},
		{0xA4A2B8, new Dictionary<int, string> { // $598 (CRASH_LV)
			{1, "Misappropriation"},
			{2, "High Noon"}
		}},
		{0xA4A328, new Dictionary<int, string> { // $MANSION_TOTAL_PASSED_MISSIONS
			{1, "A Home in the Hills"},
			{2, "Vertical Bird"},
			{3, "Home Coming"},
			{4, "Cut Throat Business"}
		}},
		{0xA4A32C, new Dictionary<int, string> { // $GROVE_TOTAL_PASSED_MISSIONS
			{1, "Beat Down on B Dup"},
			{2, "Grove 4 Life"}
		}},
		{0xA4A334, new Dictionary<int, string> { // $RIOT_TOTAL_PASSED_MISSIONS
			{1, "Riot"},
			{2, "Los Desperados"},
			{3, "End of the Line Part 1"},
			{4, "End of the Line Part 2"},
			{5, "End of the Line Part 3"}
		}},
	};

	
	

	// State keeping
	vars.split = new List<string>();
	vars.PrevPhase = null;

	// Add missions as watched memory values
	vars.watchers = new MemoryWatcherList();
	foreach (var item in vars.missions) {
		vars.watchers.Add(
			new MemoryWatcher<int>(
				new DeepPointer(item.Key+offset)
			) { Name = item.Key.ToString() }
		);
	}
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(playingTime)) { Name = "playingTime" });
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(0xB7CD98+offset, 0x530)) { Name = "pedStatus" });
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(0xA51698+offset)) { Name = "eotl" });
	vars.watchers.Add(new MemoryWatcher<byte>(new DeepPointer(menuAddr)) { Name = "menu" });
	vars.watchers.Add(new MemoryWatcher<byte>(new DeepPointer(0xBA67A5+offset)) { Name = "loading" });
	vars.watchers.Add(new MemoryWatcher<byte>(new DeepPointer(startAddr)) { Name = "started" });
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(tagsAddr)) { Name = "tags" });
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(0x81CADC)) { Name = "test" });
	vars.watchers.Add(new StringWatcher(new DeepPointer(threadAddr, 0x8), 10) { Name = "thread" });

	
	vars.watchers.UpdateAll(game);


	// Utility Functions
	/*
	 * Easier debug output.
	 */
	Action<string> DebugOutput = (text) => {
		print("[GTASA Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;

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
					DebugOutput("Check: "+m+" "+item2.Key.ToString()+" >= "+currentValue);
					return currentValue >= item2.Key;
				}
			}
		}
		DebugOutput("Mission not found: "+m);
		return false;
	};
	vars.Passed = MissionPassed;

	/*
	 * Check if splitting should occur based on whether this split
	 * has already been split since the timer started or is on the
	 * blacklist.
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
	

	refreshRate = 30;
	DebugOutput("Initialized (Version "+version+")");

	// Test
	//print(MissionPassed("Tanker Commander").ToString());
	vars.lastLoad = 0;
}

update {

	// Update always, to prevent splitting after loading (if possible, doesn't seem to be 100% reliable)
	vars.watchers.UpdateAll(game);

	//vars.DebugOutput(vars.watchers["thread"].Current+" "+current.thread);

	// Clear list of already executed splits if timer is reset
	if (timer.CurrentPhase != vars.PrevPhase) {
		if (timer.CurrentPhase == TimerPhase.NotRunning) {
			vars.split.Clear();
			vars.DebugOutput("Cleared list of already executed splits");
		}
		vars.PrevPhase = timer.CurrentPhase;
	}
	if (vars.watchers["test"].Current != vars.watchers["test"].Old) {
		vars.DebugOutput("Test: "+vars.watchers["test"].Current);
	}
}

split {
	
	if (vars.watchers["loading"].Current == 1) {
		vars.DebugOutput("Loading");
		vars.lastLoad = Environment.TickCount;
		return false;
	}
	if (Environment.TickCount - vars.lastLoad < 500) {
		vars.DebugOutput("Wait..");
		return false;
	}

	// Split missions
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
	var pedStatus = vars.watchers["pedStatus"];
	if (pedStatus.Current != pedStatus.Old) {
		if (pedStatus.Current == 63) // Busted
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
		if (pedStatus.Current == 55) // Wasted
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

	// End of any%
	var eotl = vars.watchers["eotl"];
	if (eotl.Current == 3 && eotl.Old == 2) {
		// This check is probably not necessary since the variable $8014 seems to be
		// only used in EotL Part 3, but just to be safe.
		if (vars.Passed("End of the Line Part 2"))
		{
			return vars.TrySplit("any%");
		}
	}

	// Starting a certain mission
	var thread = vars.watchers["thread"];
	if (thread.Current != thread.Old) {
		if (thread.Current == "manson5") // Cut Throat Business
		{
			return vars.TrySplit("Gang Territories #2");
		}
		else if (thread.Current == "grove2") // Grove 4 Life
		{
			return vars.TrySplit("Gang Territories #1");
		}
	}

	var tags = vars.watchers["tags"];
	if (tags.Current > tags.Old) {
		//vars.DebugOutput("Split Tag");
		//return true;
	}
}

start {
	var menu = vars.watchers["menu"];
	var playingTime = vars.watchers["playingTime"];
	var started = vars.watchers["started"];
	//print(started.Current.ToString()+" "+playingTime.Current.ToString()+" "+menu.Current);
	if (menu.Current != 6) {
		return false;
	}
	if (playingTime.Current > 30000) {
		return false;
	}

	/*
	 * The value can either switch from 1->2 or from 0->1 when the timer should be
	 * started, depending on whether the game was started fresh or not. Simply checking
	 * for an increase after 3 seconds (where the first increase already would have taken
	 * place) could be an easy workaround.
	 */
	if (playingTime.Current > 3000 && started.Current > started.Old) {
		vars.DebugOutput("New Game");
		return true;
	}
}

reset {
	var playingTime = vars.watchers["playingTime"];
	/*
	 * Check if playing time is in the range where the New Game is still starting (before
	 * intro cutscene) but the timer hasn't started yet. This ensures that the timer is
	 * only reset at the very start of the game and not when loading a save or mid-game.
	 * 
	 * Trying to check playingTime == 0 can be dangerous because when loading a save values
	 * may be 0 for a bit. In addition, when starting the game, the value may not actually
	 * be 0.
	 */
	if (playingTime.Current > 500 && playingTime.Current < 1000) {
		vars.DebugOutput("Reset");
		return true;
	}
}

