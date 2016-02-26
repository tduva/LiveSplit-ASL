
/*
 * All addresses defined in this script are relative to the module, so without
 * the 0x400000 or whatever the module address is (different for more recent
 * Steam version).
 */

state("gta_sa")
{
	int version_100_EU : 0x4245BC;
	int version_100_US : 0x42457C;
	int version_101_EU : 0x42533C;
	int version_101_US : 0x4252FC;
	int version_300_Steam : 0x45EC4A;
	int version_101_Steam : 0x45DEDA;
}

// Detect .exe of the Steam version (notice the "-" instead of "_")
state("gta-sa")
{
	int version_100_EU : 0x4245BC;
	int version_100_US : 0x42457C;
	int version_101_EU : 0x42533C;
	int version_101_US : 0x4252FC;
	int version_300_Steam : 0x45EC4A;
	int version_101_Steam : 0x45DEDA;
}

startup
{
	//=============================================================================
	// Memory Addresses
	//=============================================================================
	// There are more memory addresses defined in `init` in the "Version Detection"
	// and "Memory Watcher" sections.

	// Collectibles
	//=============
	/*
	 * First Address: 1.0
	 * Second Address: Steam
	 * 
	 * Collectible type acts as setting ID, so don't change it.
	 */
	vars.collectibles = new Dictionary<string,List<int>> {
		{"Photos",	new List<int> {0x7791BC, 0x80C3E4}},
		{"Tags",	new List<int> {0x69AD74, 0x71258C}},
		{"Oysters",	new List<int> {0x7791EC, 0x80C414}},
		{"Horseshoes", 	new List<int> {0x7791E4, 0x80C40C}}
	};

	// Missions
	//=========
	/*
	 * Memory addresses and the associated values and missions.
	 *
	 * Commenting out missions may interfere with custom splits that
	 * refer to their status (MissionPassed-function).
	 *
	 * Mission names defined here also act as setting IDs, so don't change
	 * them.
	 */
	vars.missions = new Dictionary<int, Dictionary<int, string>> {
		{0x64A060, new Dictionary<int, string> { // $INTRO_TOTAL_PASSED_MISSIONS
			{1, "Big Smoke"},
			{2, "Ryder"}
		}},
		{0x64A070, new Dictionary<int, string> { // $SWEET_TOTAL_PASSED_MISSIONS
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
		{0x64A078, new Dictionary<int, string> { // $SMOKE_TOTAL_PASSED_MISSIONS
			{1, "OG Loc"},
			{2, "Running Dog"},
			{3, "Wrong Side of the Tracks"},
			{4, "Just Business"}
		}},
		{0x64A074, new Dictionary<int, string> { // $RYDER_TOTAL_PASSED_MISSIONS
			{1, "Home Invasion"},
			{2, "Catalyst"},
			{3, "Robbing Uncle Sam"}
		}},
		{0x64A088, new Dictionary<int, string> { // $LS_FINAL_TOTAL_PASSED_MISSIONS
			{1, "Reuniting the Families"},
			{2, "The Green Sabre"}
		}},
		{0x64A080, new Dictionary<int, string> { // $CRASH_LS_TOTAL_PASSED_MISSIONS
			{1, "Burning Desire"},
			{2, "Gray Imports"}
		}},
		{0x64A07C, new Dictionary<int, string> { // $OG_LOC_TOTAL_PASSED_MISSIONS
			{1, "Life's a Beach"},
			{2, "Madd Dogg's Rhymes"},
			{3, "Management Issues"},
			{4, "House Party (Cutscene)"},
			{5, "House Party"}
		}},
		{0x64A084, new Dictionary<int, string> { // $MISSION_LOWRIDER_PASSED
			{1, "High Stakes Lowrider"}
		}}, 
		{0x64A114, new Dictionary<int, string> { // $MISSION_BADLANDS_PASSED
			{1, "Badlands"}
		}},
		{0x64A490, new Dictionary<int, string> { // $MISSION_TANKER_COMMANDER_PASSED
			{1, "Tanker Commander"}
		}},
		{0x64A48C, new Dictionary<int, string> { // $MISSION_SMALL_TOWN_BANK_PASSED
			{1, "Small Town Bank"}
		}},
		{0x64A488, new Dictionary<int, string> { // $MISSION_LOCAL_LIQUOR_STORE_PASSED
			{1, "Local Liquor Store"}
		}},
		{0x64A494, new Dictionary<int, string> { // $ALL_CATALINA_MISSIONS_PASSED (not aptly named variable)
			{1, "Against All Odds"}
		}},
		{0x64BB2C, new Dictionary<int, string> { // $2163
			{1, "King in Exile"}
		}},
		{0x64A10C, new Dictionary<int, string> { // $TRUTH_TOTAL_PASSED_MISSIONS
			{1, "Body Harvest"},
			{2, "Are You Going To San Fierro?"}
		}},
		{0x64BDC8, new Dictionary<int, string> { // $RACES_WON_NUMBER
			{2, "Wu Zi Mu"},
			{3, "Farewell, My Love"}
		}},
		{0x64A1D4, new Dictionary<int, string> { // $GARAGE_TOTAL_PASSED_MISSIONS
			{1, "Wear Flowers in your Hair"},
			{2, "Deconstruction"}
		}},
		{0x64A1DC, new Dictionary<int, string> { // $WUZIMU_TOTAL_PASSED_MISSIONS
			{1, "Mountain Cloud Boys"},
			{2, "Ran Fa Li"},
			{3, "Lure"},
			{4, "Amphibious Assault"},
			{5, "The Da Nang Thang"}
		}},
		{0x64A1E4, new Dictionary<int, string> { // $SYNDICATE_TOTAL_PASSED_MISSIONS
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
		{0x64A1E8, new Dictionary<int, string> { // $CRASH_SF_TOTAL_PASSED_MISSIONS
			{1, "555 WE TIP"},
			{2, "Snail Trail"}
		}},
		{0x64A2A4, new Dictionary<int, string> { // $TORENO_TOTAL_PASSED_MISSIONS
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
		{0x64A1D8, new Dictionary<int, string> { // $ZERO_TOTAL_PASSED_MISSIONS
			{1, "Air Raid"},
			{2, "Supply Lines..."},
			{3, "New Model Army"}
		}},
		{0x64A1E0, new Dictionary<int, string> { // $STEAL_TOTAL_PASSED_MISSIONS
			{1, "Zeroing In"},
			{2, "Test Drive"},
			{3, "Customs Fast Track"},
			{4, "Puncture Wounds"}
		}},
		{0x64A2B4, new Dictionary<int, string> { // $CASINO_TOTAL_PASSED_MISSIONS
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
		{0x64A2B8, new Dictionary<int, string> { // $598 (CRASH_LV)
			{1, "Misappropriation"},
			{2, "High Noon"}
		}},
		{0x64A2BC, new Dictionary<int, string> { // $599 (Madd Dogg)
			{1, "Madd Dogg"}
		}},
		{0x64A2C0, new Dictionary<int, string> { // $HEIST_TOTAL_PASSED_MISSIONS
			{1, "Architectural Espionage"},
			{2, "Key to her Heart"},
			{3, "Dam and Blast"},
			{4, "Cop Wheels"},
			{5, "Up, Up and Away!"},
			{6, "Breaking the Bank at Caligula's"}
		}},
		{0x64A328, new Dictionary<int, string> { // $MANSION_TOTAL_PASSED_MISSIONS
			{1, "A Home in the Hills"},
			{2, "Vertical Bird"},
			{3, "Home Coming"},
			{4, "Cut Throat Business"}
		}},
		{0x64A32C, new Dictionary<int, string> { // $GROVE_TOTAL_PASSED_MISSIONS
			{1, "Beat Down on B Dup"},
			{2, "Grove 4 Life"}
		}},
		{0x64A334, new Dictionary<int, string> { // $RIOT_TOTAL_PASSED_MISSIONS
			{1, "Riot"},
			{2, "Los Desperados"},
			{3, "End of the Line Part 1"},
			{4, "End of the Line Part 2"},
			{5, "End of the Line Part 3"} // After credits
		}},
		{0x649AB8, new Dictionary<int, string> { // $MISSION_BACK_TO_SCHOOL_PASSED
			{1, "Driving School Passed"}
		}},
		{0x64B824, new Dictionary<int, string> { // $MISSION_BOAT_SCHOOL_PASSED
			{1, "Boat School Passed"}
		}},
		{0x64BBC4, new Dictionary<int, string> { // $MISSION_DRIVING_SCHOOL_PASSED (actually Bike School)
			{1, "Bike School Passed"}
		}},
		{0x6518DC, new Dictionary<int, string> { // $TRUCKING_TOTAL_PASSED_MISSIONS
			{1, "Trucking 1"},
			{2, "Trucking 2"},
			{3, "Trucking 3"},
			{4, "Trucking 4"},
			{5, "Trucking 5"},
			{6, "Trucking 6"},
			{7, "Trucking 7"},
			{8, "Trucking 8"}
		}},
	};


	//=============================================================================
	// Utility Functions
	//=============================================================================

	/*
	 * Easier debug output.
	 */
	Action<string> DebugOutput = (text) => {
		print("[GTASA Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;


	//=============================================================================
	// Settings
	//=============================================================================
	// Settings are mostly added manually (not directly from the mission definition)
	// so they can be manually sorted (the usual mission order).

	// Setting Functions
	//==================

	// Check if the given string is the name of a mission as defined in vars.missions
	Func<string, bool> missionPresent = m => {
		foreach (var item in vars.missions)
		{
			foreach (var item2 in item.Value)
			{
				if (item2.Value == m)
				{
					return true;
				}
			}
		}
		vars.DebugOutput("Mission not found: "+m);
		return false;
	};

	// Function to add a list of missions (including check if they are a mission)
	Action<string, List<string>> addMissions = (header, missions) => {
		foreach (var mission in missions) {
			if (missionPresent(mission)) {
				settings.Add(mission, true, mission, header);
			}
		}
	};

	Action<string, int> addMissions2 = (header, missions) => {
		settings.Add(header+"Missions", true, header);
		foreach (var item in vars.missions[missions]) {
			var mission = item.Value;
			if (missionPresent(mission)) {
				settings.Add(mission, true, mission, header+"Missions");
			}
		}
	};

	// Function to add a single mission (checking if it's a mission)
	Action<string, bool, string> addMissionCustom = (mission, defaultValue, label) => {
		if (missionPresent(mission)) {
			settings.Add(mission, defaultValue, label);
		}
	};

	// Function to add a single mission, with default values
	Action<string> addMission = (mission) => {
		if (missionPresent(mission)) {
			settings.Add(mission);
		}
	};

	// Main Missions
	//==============
	settings.Add("Missions", true, "Main Missions (any%)");
	settings.SetToolTip("Missions", "Main Missions and other splits that commonly occur in the any% route");

	settings.CurrentDefaultParent = "Missions";
	settings.Add("LS", true, "Los Santos");
	settings.Add("BL", true, "Badlands");
	settings.Add("SF", true, "San Fierro");
	settings.Add("Desert", true);
	settings.Add("LV", true, "Las Venturas");
	settings.Add("RTLS", true, "RTLS");
	settings.CurrentDefaultParent = null;
	
	// Los Santos
	//-----------
	addMissions("LS", new List<string>() {
		"Big Smoke", "Ryder", "Tagging up Turf", "Cleaning the Hood", "Drive-Thru",
		"Nines and AKs", "OG Loc", "Life's a Beach", "Running Dog", "Drive-By",
		"Sweet's Girl", "Cesar Vialpando", "High Stakes Lowrider", "Madd Dogg's Rhymes",
		"Management Issues", "House Party (Cutscene)", "Burning Desire",
		"Wrong Side of the Tracks", "Just Business", "Doberman", "Gray Imports",
		"Home Invasion", "House Party", "Catalyst", "Robbing Uncle Sam", "Los Sepulcros",
		"Reuniting the Families", "The Green Sabre"
	});

	// Badlands
	//---------
	settings.CurrentDefaultParent = "BL";
	addMission("Badlands");
	settings.Add("Bustedwarp BL #1", true, "[Bustedwarp Badlands #1]");
	addMission("Tanker Commander");
	settings.Add("Deathwarp BL #1", true, "[Deathwarp Badlands #1]");
	addMission("Body Harvest");
	settings.Add("Deathwarp BL #2", true, "[Deathwarp Badlands #2]");
	addMission("King in Exile");
	settings.Add("Bustedwarp BL #2", true, "[Bustedwarp Badlands #2]");
	addMissions("BL", new List<string>() {
		"Small Town Bank", "Local Liquor Store", "Against All Odds", "Wu Zi Mu",
		"Farewell, My Love", "Are You Going To San Fierro?"
	});
	settings.CurrentDefaultParent = null;

	// San Fierro
	//-----------
	addMissions("SF", new List<string>() {
		"Wear Flowers in your Hair", "555 WE TIP", "Deconstruction", "Photo Opportunity",
		"Jizzy (Cutscene)", "Jizzy", "T-Bone Mendez", "Mike Toreno", "Outrider",
		"Snail Trail", "Mountain Cloud Boys", "Ran Fa Li", "Lure", "Ice Cold Killa",
		"Amphibious Assault", "Pier 69", "Toreno's Last Flight", "The Da Nang Thang",
		"Yay Ka-Boom-Boom"
	});


	// Desert
	//-------
	addMissions("Desert", new List<string>() {
		"Monster", "Highjack", "Interdiction", "Verdant Meadows", "Learning to Fly"
	});

	// Las Venturas
	//-------------
	addMissions("LV", new List<string>() {
		"N.O.E.", "Freefall", "Fender Ketchup", "Explosive Situation", "You've Had Your Chips",
		"Don Peyote", "Intensive Care", "The Meat Business", "Fish in a Barrel", "Madd Dogg",
		"Misappropriation", "Stowaway", "Black Project", "High Noon", "Green Goo",
		"Saint Mark's Bistro"
	});

	// Return to Los Santos
	//---------------------
	settings.CurrentDefaultParent = "RTLS";

	addMissions("RTLS", new List<string>() {
		"A Home in the Hills", "Vertical Bird", "Home Coming", "Beat Down on B Dup",
		"Grove 4 Life", "Cut Throat Business", "Riot", "Los Desperados"
	});
	addMissionCustom("End of the Line Part 1", false, "End of the Line Part 1 (after killing Big Smoke)");
	addMissionCustom("End of the Line Part 2", false, "End of the Line Part 2 (start of Chase)");
	addMissionCustom("End of the Line Part 3", false, "End of the Line Part 3 (after Credits)");

	settings.Add("GT #1", false, "Gang Territories #1 (at starting of Grove 4 Life");
	settings.Add("GT #2", false, "Gang Territories #2 (at starting of Cut Throat Business");
	settings.Add("any%", true, "End of any% (start of Firetruck Bridge Cutscene)");

	settings.CurrentDefaultParent = null;

	// Side Missions
	//==============
	settings.Add("Missions2", true, "Side Missions");
	settings.CurrentDefaultParent = "Missions2";

	addMissions2("Zero", 0x64A1D8);
	addMissions2("Wang Cars", 0x64A1E0);
	addMissions2("Heist", 0x64A2C0);
	settings.Add("Schools");
	addMissions("Schools", new List<string>() {
		"Driving School Passed", "Boat School Passed", "Bike School Passed"
	});
	addMissions2("Trucking", 0x6518DC);

	settings.CurrentDefaultParent = null;
	
	// Collectibles
	//=============
	settings.Add("Collectibles", false, "Collectibles");
	settings.CurrentDefaultParent = "Collectibles";
	foreach (var item in vars.collectibles)
	{
		settings.Add(item.Key+"All", false, item.Key+" (All Done)");
		settings.Add(item.Key+"Each", false, item.Key+" (Each)");
	}
	settings.CurrentDefaultParent = null;

	// Other Settings
	//===============
	settings.Add("startOnSaveLoad", false, "Start timer when loading save (experimental)");
	settings.SetToolTip("startOnSaveLoad",
		@"This may start the timer too early on New Game, however if you have Reset enabled, 
 it should reset again before the desired start.");

	//=============================================================================
	// Other Stuff
	//=============================================================================
	refreshRate = 30;
}

init
{
	//=============================================================================
	// Version Detection
	//=============================================================================
	vars.enabled = true;
	var versionValue = 38079;
	int versionOffset = 0;

	int playingTimeAddr = 	0x77CB84;
	int startAddr =		0x77CEDC;
	int menuAddr =		0x7A68A5;
	int threadAddr =	0x68B42C;
	int loadingAddr =	0x7A67A5;
	int playerPedAddr =	0x77CD98;

	// Detect Version
	//===============
	// Look for both the value in the memory and the module size to determine the
	// version.
	//
	// Checking the memory value doesn't seem to work for the more recent Steam
	// version at all. In addition to that, it also doesn't seem to work if the
	// game is still checking the CD (if you're not using Steam or NoCD version).
	//
	// The memory values and associated versions/offsets where taken from the
	// AHK Autosplitter and checked and extended as possible.

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
		// This may be some kind of Austrian version
		versionOffset = 0x2680;
		version = "2.00";
	}
	if (current.version_300_Steam == versionValue
		|| moduleSize == 9691136)
	{
		// Older Steam version, still showing 3.00 in the menu and may work with
		// just the offset (since 1.01 works like that and they seem similiar)
		versionOffset = 0x75130;
		version = "3.00 Steam";
	}
	if (current.version_101_Steam == versionValue)
	{
		// Otherwise unknown version
		versionOffset = 0x75770;
		version = "1.01 Steam";
	}
	if (moduleSize == 9981952)
	{
		// More recent Steam Version (no version in menu), this is referred to
		// as just "Steam"
		versionOffset = 0x77970;
		version = "Steam";
		playingTimeAddr = 0x80FD74;
		startAddr =	0x810214;
		menuAddr =	0x5409BC;
		threadAddr =	0x702D98;
		loadingAddr =	0x833995;
		playerPedAddr =	0x8100D0;
	}

	// Version detected
	//=================

	if (version == "")
	{
		version = "<unknown>";
		vars.enabled = false;
	}

	// Extra variable because versionOffset was different from offset before (keep it
	// like this just in case)
	int offset = versionOffset;

	// Apply offset, except for Steam, since that version has completely separate addresses
	if (version != "Steam") {
		playingTimeAddr += offset;
		startAddr += offset;
		menuAddr += offset;
		threadAddr += offset;
		loadingAddr += offset;
		playerPedAddr += offset;
	}
	
	//=============================================================================
	// State keeping
	//=============================================================================

	// Already split splits during this attempt (until timer reset)
	vars.split = new List<string>();

	// Track timer phase
	vars.PrevPhase = null;

	// Timestamp when the last load occured (load means loading from a save
	// and such, not load screens)
	vars.lastLoad = 0;

	//=============================================================================
	// Memory Watcher
	//=============================================================================

	// Add missions as watched memory values
	vars.watchers = new MemoryWatcherList();
	foreach (var item in vars.missions) {
		vars.watchers.Add(
			new MemoryWatcher<int>(
				new DeepPointer(item.Key+offset)
			) { Name = item.Key.ToString() }
		);

		// Check if setting for each mission exists (this will output a message to debug if not)
		foreach (var m in item.Value) {
			if (settings[m.Value]) { }
		}
	}
	
	// Add other values that aren't missions
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(0x651698+offset)) { Name = "eotl" });
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(0x64ED04+offset)) { Name = "intro_state" });

	// This means loading from a save and such, not load screens (this doesn't work with Steam since I couldn't find the address for it)
	vars.watchers.Add(new MemoryWatcher<bool>(new DeepPointer(loadingAddr)) { Name = "loading" });

	// Values that have a different address defined for the Steam version
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(playerPedAddr, 0x530)) { Name = "pedStatus" });
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(playingTimeAddr)) { Name = "playingTime" });
	vars.watchers.Add(new MemoryWatcher<byte>(new DeepPointer(menuAddr)) { Name = "menu" });
	vars.watchers.Add(new MemoryWatcher<byte>(new DeepPointer(startAddr)) { Name = "started" });
	vars.watchers.Add(new StringWatcher(new DeepPointer(threadAddr, 0x8), 10) { Name = "thread" });

	// Collectibles (separate Steam version addresses are defined in vars.collectibles
	// and chosen here if Steam version was detected)
	foreach (var item in vars.collectibles) {
		var type = item.Key;
		var addr = item.Value[0]+versionOffset;
		if (version == "Steam") {
			addr = item.Value[1];
		}
		vars.watchers.Add(
			new MemoryWatcher<int>(
				new DeepPointer(addr)
			) { Name = type }
		);
	}

	vars.watchers.UpdateAll(game);

	//=============================================================================	
	// Utility functions
	//=============================================================================

	/*
	 * Check if splitting should occur based on whether this split
	 * has already been split since the timer started or is on the
	 * blacklist.
	 * 
	 * If this returns true (the split should occur), the split
	 * is also added to the list of already split splits. (Kappab)
	 */
	Func<string, bool> TrySplit = (splitId) => {
		if (!settings[splitId]) {
			return false;
		}
		if (!vars.split.Contains(splitId)) {
			vars.split.Add(splitId);
			vars.DebugOutput("Split: "+splitId);
			return true;
		}
		return false;
	};
	vars.TrySplit = TrySplit;

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
					vars.DebugOutput("Check: "+m+" "+item2.Key.ToString()+" >= "+currentValue);
					return currentValue >= item2.Key;
				}
			}
		}
		vars.DebugOutput("Mission not found: "+m);
		return false;
	};
	vars.Passed = MissionPassed;
}

update
{
	//=============================================================================
	// General Housekeeping
	//=============================================================================
	// Disable all timer control actions if version was not detected
	if (!vars.enabled)
		return false;

	// Update always, to prevent splitting after loading (if possible, doesn't seem to be 100% reliable)
	vars.watchers.UpdateAll(game);

	// Clear list of already executed splits if timer is reset
	if (timer.CurrentPhase != vars.PrevPhase)
	{
		if (timer.CurrentPhase == TimerPhase.NotRunning)
		{
			vars.split.Clear();
			vars.DebugOutput("Cleared list of already executed splits");
		}
		vars.PrevPhase = timer.CurrentPhase;
	}

	//print(vars.watchers["pedStatus"].Current.ToString());
}

split
{
	//=============================================================================
	// Split prevention
	//=============================================================================
	if (vars.watchers["loading"].Current) {
		vars.DebugOutput("Loading");
		vars.lastLoad = Environment.TickCount;
		return false;
	}
	if (Environment.TickCount - vars.lastLoad < 500) {
		// Prevent splitting shortly after loading from a save, since this can
		// sometimes occur because memory values change (this doesn't work with
		// the Steam version)
		vars.DebugOutput("Wait..");
		return false;
	}

	//=============================================================================
	// Splits
	//=============================================================================

	// Split missions
	//===============
	foreach (var item in vars.missions) {
		var value = vars.watchers[item.Key.ToString()];
		if (value.Current > value.Old && item.Value.ContainsKey(value.Current)) {
			string splitId = item.Value[value.Current];
			if (vars.TrySplit(splitId)) {
				return true;
			}
		}
	}

	// Split collectibles
	//===================
	foreach (var item in vars.collectibles) {
		var value = vars.watchers[item.Key.ToString()];
		if (value.Current > value.Old) {
			var type = item.Key;
			if (settings[type+"All"])
			{
				int max = 50;
				if (type == "Tags")
					max = 100;
				if (value.Current == max && value.Old == max-1)
				{
					return vars.TrySplit(type+"All");
				}
			}
			if (settings[type+"Each"]) {
				// Need to keep track of already split splits seperately from the setting
				var splitName = type+" "+value.Current;
				if (!vars.split.Contains(splitName))
				{
					vars.split.Add(splitName);
					vars.DebugOutput("Split: "+splitName);
					return true;
				}
			}
		}
	}

	// Busted/Deathwarp
	//=================
	var pedStatus = vars.watchers["pedStatus"];
	if (pedStatus.Current != pedStatus.Old) {
		if (pedStatus.Current == 63) // Busted
		{
			if (vars.Passed("Badlands") && !vars.Passed("Tanker Commander"))
			{
				return vars.TrySplit("Bustedwarp BL #1");
			}
			else if (vars.Passed("King in Exile") && !vars.Passed("Small Town Bank"))
			{
				return vars.TrySplit("Bustedwarp BL #2");
			}
		}
		if (pedStatus.Current == 55) // Wasted
		{
			if (vars.Passed("Tanker Commander") && !vars.Passed("Body Harvest"))
			{
				return vars.TrySplit("Deathwarp BL #1");
			}
			else if (vars.Passed("Body Harvest") && !vars.Passed("King in Exile"))
			{
				return vars.TrySplit("Deathwarp BL #2");
			}
		}
	}

	// End of any%
	//============
	var eotl = vars.watchers["eotl"];
	if (eotl.Current == 3 && eotl.Old == 2)
	{
		// This check is probably not necessary since the variable $8014 seems to be
		// only used in EotL Part 3, but just to be safe.
		if (vars.Passed("End of the Line Part 2"))
		{
			return vars.TrySplit("any%");
		}
	}

	// Starting a certain mission
	//===========================
	var thread = vars.watchers["thread"];
	if (thread.Current != thread.Old)
	{
		if (thread.Current == "manson5") // Cut Throat Business
		{
			return vars.TrySplit("GT #2");
		}
		else if (thread.Current == "grove2") // Grove 4 Life
		{
			return vars.TrySplit("GT #1");
		}
	}
}

start
{
	var menu = vars.watchers["menu"];
	var playingTime = vars.watchers["playingTime"];
	var started = vars.watchers["started"];
	var intro_state = vars.watchers["intro_state"];
	var loading = vars.watchers["loading"];

	//print(started.Current.ToString()+" "+playingTime.Current.ToString()+" "+menu.Current);
	if (menu.Current != 6)
	{
		// Starting a New Game usually sets the menu to 6, but doesn't really seem to work with Steam
		//return false;
		//vars.DebugOutput("No start");
	}

	/*
	 * intro_state is a variable only used in the intro mission, changing from
	 * 0 to 1 when the cutscene is skipped. It always gets set to other values
	 * during the intro cutscene, so the timer will only start when you skip the
	 * cutscene within the first 90s or so.
	 */
	if (intro_state.Current == 1 && intro_state.Old == 0)
	{
		if (settings.StartEnabled)
		{
			// Only output when actually starting timer
			vars.DebugOutput("New Game");
		}
		return true;
	}
	if (settings["startOnSaveLoad"] && !loading.Current && loading.Old)
	{
		return true;
	}
}


reset
{
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
	if (playingTime.Current > 500 && playingTime.Current < 1000)
	{
		if (settings.ResetEnabled)
		{
			// Only output when actually resetting
			vars.DebugOutput("Reset");
		}
		return true;
	}
}

