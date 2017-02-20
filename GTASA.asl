
/*
 * All addresses defined in this script are relative to the module, so without
 * the 0x400000 or whatever the module address is (different for more recent
 * Steam version).
 *
 * Most addresses are for the 1.0 version (unless noted otherwise). All global
 * variables seem to work in all versions if you apply the appropriate version
 * offset. Global variables refers to variables that are written in the mission
 * script as $1234. Other addresses have to be manually corrected for the Steam
 * version.
 *
 * All splits are only split once per reset (so if you load an earlier Save and
 * revert splits, it won't split them again). This is mostly because this
 * behaviour makes sense: If you move back through the splits manually, you
 * should also split those splits manually. It is however also required for
 * the "Split at start of missions" section, which splits based on the current
 * first thread and would most likely split several times otherwise.
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
		{0x64BDC8, new Dictionary<int, string> { // $RACES_WON_NUMBER (first 3 Races are in a fixed order due to missions)
			{2, "Wu Zi Mu"},
			{3, "Farewell, My Love"},
			{25, "All Races Won"}
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
	/*
		{0x64A9C4, new Dictionary<int, string> { // $CURRENT_WANTED_LIST (Export)
			{1, "Export List 1 Complete"},
			{2, "Export List 2 Complete"}
		}},
		{0x64ABE0, new Dictionary<int, string> { // $ALL_CARS_COLLECTED_FLAG
			{1, "Export List 3 Complete"}
		}},
	*/
	};

	// Other Missions
	//===============
	// Addresses that are responsible for a single mission each.
	//
	vars.missions2 = new Dictionary<string, Dictionary<int, string>> {
		// Flight School not here because it is a Story Mission
		{"Schools", new Dictionary<int, string> {
			{0x649AB8, "Driving School Passed"},	// $MISSION_BACK_TO_SCHOOL_PASSED
			{0x64B824, "Boat School Passed"},	// $MISSION_BOAT_SCHOOL_PASSED
			{0x64BBC4, "Bike School Passed"},	// $MISSION_DRIVING_SCHOOL_PASSED (actually Bike School)
		}},
		{"Vehicle Submissions", new Dictionary<int, string> {
			{0x64B0A4, "Firefighter Complete"},	// $1489 (directly goes to 2 when complete)
			{0x64B0A0, "Vigilante Complete"},	// $1488
			{0x64B0AC, "Taxi Mission Complete"},	// $MISSION_TAXI_PASSED ($1491)
			{0x64B09C, "Paramedic Complete"},	// $1487
			{0x64B87C, "Pimping Complete"},		// $MISSION_PIMPING_PASSED ($1991)
		}},
		{"Properties", new Dictionary<int, string> {
			{0x64B2B0, "Zero (RC Shop Bought)"},
			{0x64A4CC, "Santa Maria Beach (Safehouse)"},
			{0x64A4D0, "Rockshore West (Safehouse)"},
			{0x64A4D4, "Fort Carson (Safehouse)"},
			{0x64A4D8, "Prickle Pine (Safehouse)"},
			{0x64A4DC, "Whitewood Estate (Safehouse)"},
			{0x64A4E0, "Palomino Creek (Safehouse)"},
			{0x64A4E4, "Redsands West (Safehouse)"},
			{0x64A4E8, "Verdant Bluffs (Safehouse)"},
			{0x64A4EC, "Calton Heights (Safehouse)"},
			{0x64A4F0, "Mulholland (Safehouse)"},
			{0x64A4F4, "Paradiso (Safehouse)"},
			{0x64A4F8, "Hashbury (Safehouse)"},
			{0x64A4FC, "Verona Beach (Safehouse)"},
			{0x64A500, "Pirates In Men's Pants (Hotel Suite)"},
			{0x64A504, "The Camel's Toe (Hotel Suite)"},
			{0x64A508, "Chinatown (Safehouse)"},
			{0x64A50C, "Whetstone (Safehouse)"},
			{0x64A510, "Doherty (Safehouse)"},
			{0x64A514, "Queens (Hotel Suite)"},
			{0x64A518, "Angel Pine (Safehouse)"},
			{0x64A51C, "El Quebrados (Safehouse)"},
			{0x64A520, "Tierra Robada (Safehouse)"},
			{0x64A524, "Dillimore (Safehouse)"},
			{0x64A528, "Jefferson (Safehouse)"},
			{0x64A52C, "Old Venturas Strip (Hotel Suite)"},
			{0x64A530, "The Clown's Pocket (Hotel Suite)"},
			{0x64A534, "Creek (Safehouse)"},
			{0x64A538, "Willowfield (Safehouse)"},
			{0x64A53C, "Blueberry (Safehouse)"},
		}},
		{"Freight", new Dictionary<int, string> {
			{0x651A20, "Freight Level 1"},	// $8240
			{0x651A1C, "Freight Level 2"},	// $8239 (goes to 2 at the end of the level)
		}},
		{"Gym Moves", new Dictionary<int, string> {
			{0x6518C4, "Los Santos Gym Moves"}, 	// $8153
			{0x6518C8, "San Fierro Gym Moves"}, 	// $8154
			{0x6518D8, "Las Venturas Gym Moves"}, 	// $8158
		}},
		{"Challenges", new Dictionary<int, string> {
			{0x64C510, "NRG-500 Stunt Challenge"}, 	// $2796
			{0x64C50C, "BMX Stunt Challenge"},	// $2795
			{0x64EBC0, "Shooting Range Complete"}, 	// $5272
		}},	
		{"Assets", new Dictionary<int, string> {
			{0x64B880, "Los Santos Courier"}, 	// $MISSION_COURIER_LS_PASSED ($1992)
			{0x64B884, "Las Venturas Courier"}, 	// $MISSION_COURIER_LV_PASSED ($1993)
			{0x64B888, "San Fierro Courier"}, 	// $MISSION_COURIER_SF_PASSED ($1994)
			{0x64B710, "Valet Parking Complete"}, 	// $1900
			{0x64B0B4, "Quarry Complete"}, 		// $MISSION_QUARRY_PASSED ($1493)
		}},
		// Races addresses are based on the global variable $RACES_WON ($2300), which
		// is an array. The number in the comment is the $RACE_INDEX ($352).
		// 
		// Missing are races that are already done during story missions:
		// Lowrider Race (0), Badlands A (7), Badlands B (8)
		//
		{"LS Races", new Dictionary<int, string> {
			{0x64BD54, "Little Loop"},		// 1
			{0x64BD58, "Backroad Wanderer"}, 	// 2
			{0x64BD5C, "City Circuit"},		// 3
			{0x64BD60, "Vinewood (Race)"},		// 4
			{0x64BD64, "Freeway (Race)"},		// 5
			{0x64BD68, "Into the Country"},		// 6
		}},
		{"SF Races", new Dictionary<int, string> {	
			{0x64BD74, "Dirtbike Danger"},		// 9
			{0x64BD78, "Bandito County"},		// 10
			{0x64BD7C, "Go-Go Karting"},		// 11
			{0x64BD80, "San Fierro Fastlane"}, 	// 12
			{0x64BD84, "San Fierro Hills"},		// 13
			{0x64BD88, "Country Endurance"}, 	// 14
		}},
		{"LV Races", new Dictionary<int, string> {
			{0x64BD8C, "SF to LV"},			// 15
			{0x64BD90, "Dam Rider"},		// 16
			{0x64BD94, "Desert Tricks"},		// 17
			{0x64BD98, "LV Ringroad"},		// 18
		}},
		{"Air Races", new Dictionary<int, string> {
			{0x64BD9C, "World War Ace"},		// 19
			{0x64BDA0, "Barnstorming"},		// 20
			{0x64BDA4, "Military Service"}, 	// 21
			{0x64BDA8, "Chopper Checkpoint"}, 	// 22
			{0x64BDAC, "Whirly Bird Waypoint"},	// 23
			{0x64BDB0, "Heli Hell"},		// 24
		}},
		{"Stadium Events", new Dictionary<int, string> {
			{0x64BDB4, "8-Track"},			// 25
			{0xA4BDB8, "Dirt Track"},		// 26
			{0x649AC8, "Kickstart"}, 		// $MISSION_KICKSTART_PASSED ($90)
			{0x64B7B4, "Bloodring"}, 		// $MISSION_BLOODRING_PASSED ($1941)
		}},
	};

	// Import/Export
	//==============
	vars.exportLists = new Dictionary<int, List<string>> {
		{0, new List<string> {
			"Buffalo", "Sentinel", "Infernus", "Camper", "Admiral",
			"Patriot", "Sanchez", "Stretch", "Feltzer", "Remington"
		}},
		{1, new List<string> {
			"Cheetah", "Rancher", "Stallion", "Tanker", "Comet",
			"Slamvan", "Blista Compact", "Stafford", "Sabre", "FCR-900"
		}},
		{2, new List<string> {
			"Banshee", "Super GT", "Journey", "Huntley", "BF Injection",
			"Blade", "Freeway", "Mesa", "ZR-350", "Euros"
		}}
	};

	// Thread Start
	//=============
	// Split when a certain thread was started, usually when a mission was started.
	//
	vars.startMissions = new Dictionary<string, string> {
		{"grove2", "GT #1"},	// Grove 4 Life
		{"manson5", "GT #2"},	// Cut Throat Business
		{"steal", "Wang Cars (Showroom Bought)"}
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
	// State keeping
	//=============================================================================

	// Already split splits during this attempt (until timer reset)
	vars.split = new List<string>();

	// Track timer phase
	vars.PrevPhase = null;

	// Timestamp when the last load occured (load means loading from a save
	// and such, not load screens)
	vars.lastLoad = 0;

	// Timestamp when the last split was executed (to prevent double-splits)
	vars.lastSplit = 0;

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
		foreach (var item in vars.missions2)
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

/*
	Func<Dictionary<int, Dictionary<int, string>>, string, bool> missionPresent2 = (d, m) => {
		foreach (var item in d)
		{
			foreach (var item2 in item.Value)
			{
				if (item2.Value == m)
				{
					return true;
				}
			}
		}
		return false;
	};
*/
	// Function to add a list of missions (including check if they are a mission)
	Action<string, List<string>> addMissionList = (parent, missions) => {
		foreach (var mission in missions) {
			if (missionPresent(mission)) {
				settings.Add(mission, true, mission, parent);
			}
		}
	};

	// Add missions from vars.missions (also add parent/header)
	//
	// header: only label
	// section: used for parent setting
	// missions: key for vars.missions (address)
	Action<string, int, string> addMissionsHeader = (section, missions, header) => {
		var parent = section+"Missions";
		settings.Add(parent, true, header);
		foreach (var item in vars.missions[missions]) {
			var mission = item.Value;
			if (missionPresent(mission)) {
				settings.Add(mission, true, mission, parent);
			}
		}
	};

	// Add missions from vars.missions2 (to existing parent)
	//
	// missions: existing parent setting, key for vars.missions2
	// defaultValue: default value for all added settings
	Action<string, bool> addMissions2 = (missions, defaultValue) => {
		var parent = missions;
		foreach (var item in vars.missions2[missions]) {
			var mission = item.Value;
			settings.Add(mission, defaultValue, mission, parent);
		}
	};

	// Adds missions from vars.missions2 (also add parent/header)
	//
	// header: only label
	// missions: parent setting name, key for vars.missions2
	// defaultValue: default value for all added settings
	Action<string, bool, string> addMissions2Header = (missions, defaultValue, header) => {
		var parent = missions;
		settings.Add(parent, defaultValue, header);
		addMissions2(missions, defaultValue);
	};

	// Add a single mission (checking if it's a mission)
	Action<string, bool, string> addMissionCustom = (mission, defaultValue, label) => {
		if (missionPresent(mission)) {
			settings.Add(mission, defaultValue, label);
		}
	};

	// Add a single mission, with default values (checking if it's a mission)
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
	addMissionList("LS", new List<string>() {
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
	settings.Add("Bustedwarp BL #1", false, "[Bustedwarp Badlands #1]");
	addMission("Tanker Commander");
	settings.Add("Deathwarp BL #1", false, "[Deathwarp Badlands #1]");
	addMission("Body Harvest");
	settings.Add("Deathwarp BL #2", false, "[Deathwarp Badlands #2]");
	addMission("King in Exile");
	settings.Add("Bustedwarp BL #2", false, "[Bustedwarp Badlands #2]");
	addMissionList("BL", new List<string>() {
		"Small Town Bank", "Local Liquor Store", "Against All Odds", "Wu Zi Mu",
		"Farewell, My Love", "Are You Going To San Fierro?"
	});
	settings.CurrentDefaultParent = null;

	// San Fierro
	//-----------
	addMissionList("SF", new List<string>() {
		"Wear Flowers in your Hair", "555 WE TIP", "Deconstruction", "Photo Opportunity",
		"Jizzy (Cutscene)", "Jizzy", "T-Bone Mendez", "Mike Toreno", "Outrider",
		"Snail Trail", "Mountain Cloud Boys", "Ran Fa Li", "Lure", "Ice Cold Killa",
		"Amphibious Assault", "Pier 69", "Toreno's Last Flight", "The Da Nang Thang",
		"Yay Ka-Boom-Boom"
	});
	settings.Add("Deathwarp SF", true, "[Deathwarp SF]", "SF");
	settings.SetToolTip("Deathwarp SF", "Splits when wasted between 'The Da Nang Thang' and 'Yay Ka-Boom-Boom'");


	// Desert
	//-------
	addMissionList("Desert", new List<string>() {
		"Monster", "Highjack", "Interdiction", "Verdant Meadows", "Learning to Fly"
	});

	// Las Venturas
	//-------------
	addMissionList("LV", new List<string>() {
		"N.O.E.", "Freefall", "Fender Ketchup", "Explosive Situation", "You've Had Your Chips",
		"Don Peyote", "Intensive Care", "The Meat Business", "Fish in a Barrel", "Madd Dogg",
		"Misappropriation", "Stowaway", "Black Project", "High Noon", "Green Goo",
		"Saint Mark's Bistro"
	});

	// Return to Los Santos
	//---------------------
	settings.CurrentDefaultParent = "RTLS";

	addMissionList("RTLS", new List<string>() {
		"A Home in the Hills", "Vertical Bird", "Home Coming", "Beat Down on B Dup",
		"Grove 4 Life", "Cut Throat Business", "Riot", "Los Desperados"
	});
	addMissionCustom("End of the Line Part 1", false, "End of the Line Part 1 (after killing Big Smoke)");
	addMissionCustom("End of the Line Part 2", false, "End of the Line Part 2 (start of Chase)");
	addMissionCustom("End of the Line Part 3", false, "End of the Line Part 3 (after Credits)");

	settings.Add("GT #1", false, "Gang Territories #1 (at starting of Grove 4 Life)");
	settings.Add("GT #2", false, "Gang Territories #2 (at starting of Cut Throat Business)");
	settings.Add("any%", true, "End of any% (start of Firetruck Bridge Cutscene)");

	settings.CurrentDefaultParent = null;


	// Side Missions
	//==============
	settings.Add("Missions2", true, "Side Missions");
	settings.CurrentDefaultParent = "Missions2";

	addMissionsHeader("Heist", 0x64A2C0, "Heist");
	addMissionsHeader("Zero", 0x64A1D8, "Zero");
	addMissionsHeader("Wang Cars", 0x64A1E0, "Wang Cars");
	addMissionsHeader("Trucking", 0x6518DC, "Trucking");
	addMissions2Header("Assets", true, "Other Asset Missions");
	addMissions2Header("Schools", true, "Schools");
	addMissions2Header("Vehicle Submissions", true, "Vehicle Submissions");
	addMissionList("Vehicle Submissions", new List<string>() { "Freight Level 1", "Freight Level 2" });
	addMissions2Header("Gym Moves", true, "Gym Moves");

	// Challenges
	//-----------
	settings.Add("Challenges", true, "Challenges", "Missions2");
	settings.CurrentDefaultParent = "Challenges";
	settings.Add("Chiliad Challenge #1");
	settings.Add("Chiliad Challenge #2");
	settings.Add("Chiliad Challenge #3");
	addMissions2("Challenges", true);

	// Stadium Events
	//---------------
	settings.CurrentDefaultParent = "Missions2";
	addMissions2Header("Stadium Events", true, "Stadium Events");
	settings.CurrentDefaultParent = null;

	// Races
	//------
	settings.Add("Races", false, "Races", "Missions2");
	settings.CurrentDefaultParent = "Races";

	settings.Add("All Races Won");
	addMissions2Header("LS Races", false, "Los Santos");
	addMissions2Header("SF Races", false, "San Fierro");
	addMissions2Header("LV Races", false, "Las Venturas");
	addMissions2Header("Air Races", false, "Air Races");

	settings.CurrentDefaultParent = null;

	// Import/Export
	//--------------
	settings.Add("Export Lists", false, "Import/Export", "Missions2");
	foreach (var list in vars.exportLists)
	{
		var listNumber = list.Key+1;
		var parent = "Export List "+listNumber;
		settings.Add(parent, true, "List "+listNumber, "Export Lists");
		foreach (var item in list.Value)
		{
			settings.Add("Export "+item, false, item, parent);
		}
		var listComplete = "Export List "+listNumber+" Complete";
		settings.Add(listComplete, false, listComplete, parent);
	}

	// Other
	//======
	settings.CurrentDefaultParent = null;
	settings.Add("Other", false);
	settings.CurrentDefaultParent = "Other";
	// Add "Properties" before addMissions2, so Wang Cars can be added at the top
	settings.Add("Properties", false);
	settings.Add("Wang Cars (Showroom Bought)", false, "Wang Cars (Showroom Bought)", "Properties");
	addMissions2("Properties", false);
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
	settings.Add("doubleSplitPrevention", true, "Double-Split Prevention");
	settings.SetToolTip("doubleSplitPrevention",
@"Impose cooldown of 2.5s between auto-splits.
This may not work for all types of splits.");


	//=============================================================================
	// Other Stuff
	//=============================================================================
	refreshRate = 30;
	vars.waiting = false;
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
		threadAddr += offset;
		loadingAddr += offset;
		playerPedAddr += offset;
	}
	
	

	//=============================================================================
	// Memory Watcher
	//=============================================================================

	// Add missions as watched memory values
	vars.watchers = new MemoryWatcherList();

	// Same address for several different splits
	foreach (var item in vars.missions) {
		vars.watchers.Add(
			new MemoryWatcher<int>(
				new DeepPointer(item.Key+offset)
			) { Name = item.Key.ToString() }
		);

		// Check if setting for each mission exists (this will output a message to debug if not,
		// for development)
		foreach (var m in item.Value) {
			if (settings[m.Value]) { }
		}
	}

	// Different address for each split
	foreach (var item in vars.missions2) {
		foreach (var m in item.Value) {
			vars.watchers.Add(
				new MemoryWatcher<int>(
					new DeepPointer(m.Key+offset)
				) { Name = m.Value }
			);

			if (settings[m.Value]) { }
		}
	}
	
	// Add global variables that aren't missions
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(0x651698+offset)) { Name = "eotl" });
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(0x64ED04+offset)) { Name = "intro_state" });
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(0x64B57C+offset)) { Name = "chiliadRace" });
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(0x64B584+offset)) { Name = "chiliadDone" });

	// This means loading from a save and such, not load screens (this doesn't work with Steam since I couldn't find the address for it)
	vars.watchers.Add(new MemoryWatcher<bool>(new DeepPointer(loadingAddr)) { Name = "loading" });

	// Values that have a different address defined for the Steam version
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(playerPedAddr, 0x530)) { Name = "pedStatus" });
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(playingTimeAddr)) { Name = "playingTime" });
	vars.watchers.Add(new MemoryWatcher<byte>(new DeepPointer(startAddr)) { Name = "started" });
	vars.watchers.Add(new StringWatcher(new DeepPointer(threadAddr, 0x8), 10) { Name = "thread" });

	// Collectibles
	//=============
	// Separate Steam version addresses are defined in vars.collectibles and
	// chosen here if Steam version was detected.
	foreach (var item in vars.collectibles) {
		var type = item.Key;
		var addr = item.Value[0]+offset;
		if (version == "Steam") {
			addr = item.Value[1];
		}
		vars.watchers.Add(
			new MemoryWatcher<int>(
				new DeepPointer(addr)
			) { Name = type }
		);
	}

	// Export Lists
	//=============

	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(0x64A9C4+offset)) { Name = "exportList" });
	var exportBaseAddr = 0x64A9F0+offset;
	for (int i = 0; i < 10; i++)
	{
		var address = exportBaseAddr + i*4;
		//print(address.ToString("X"));
		vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(address)) { Name = "export"+i });
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
	 * is also added to the list of already split splits. (Kappa b)
	 */
	Func<string, bool> TrySplit = (splitId) => {
		if (!settings[splitId]) {
			return false;
		}
		if (!vars.split.Contains(splitId)) {
			vars.split.Add(splitId);
			/*
			 * Double split prevention (mostly for duping). This is set to 2.5s so that dupes should
			 * (hopefully) not split spice, whereas close-on splits like the Deathwarp to Angel Pine
			 * after Body Harvest still do get split.
			 */
			if (!settings["doubleSplitPrevention"] || Environment.TickCount - vars.lastSplit > 2500) {
				vars.DebugOutput("Split: "+splitId);
				vars.lastSplit = Environment.TickCount;
				return true;
			}
			else {
				vars.DebugOutput("Split Prevented (Cooldown): "+splitId);
			}
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
		// sometimes occur because memory values change
		if (!vars.waiting)
		{
			vars.DebugOutput("Wait..");
			vars.waiting = true;
		}
		return false;
	}
	if (vars.waiting)
	{
		vars.DebugOutput("Done waiting..");
		vars.waiting = false;
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

	foreach (var item in vars.missions2) {
		foreach (var m in item.Value) {
			var value = vars.watchers[m.Value];
			// Some values changes from 0 -> 2, so check for > 0
			if (value.Current > 0 && value.Old == 0)
			{
				return vars.TrySplit(m.Value);
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
			else if (vars.Passed("The Da Nang Thang") && !vars.Passed("Yay Ka-Boom-Boom"))
			{
				return vars.TrySplit("Deathwarp SF");
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
	// This requires the feature of splitting every split only once, because
	// it only checks the first thread, which can sometimes change. Even when
	// checking all threads, it could cause issues if a mission is restarted
	// (e.g. if the mission failed, rather than an earlier Save loaded, where
	// splitting again may or may not be actually wanted).
	//
	// This is relatively lazy and simply checks for the first thread in the
	// list, which probably is the thread that was last started.
	//
	var thread = vars.watchers["thread"];
	if (thread.Current != thread.Old)
	{
		foreach (var item in vars.startMissions)
		{
			if (thread.Current == item.Key && vars.TrySplit(item.Value))
			{
				return true;
			}
		}
	}

	// Chiliad Challenge
	//==================
	// "chiliadRace" contains the next race to be started (1-3), but also repeats
	// when you do the races again (changes to 1 on finishing the last race).
	// "chiliadDone" changes from 0 to 1 when all races have been done.
	//
	var chiliadRace = vars.watchers["chiliadRace"];
	var chiliadDone = vars.watchers["chiliadDone"];
	if ((chiliadRace.Current > chiliadRace.Old && chiliadRace.Current > 1 && chiliadDone.Current == 0)
		|| chiliadDone.Current > chiliadDone.Old)
	{
		var raceDone = chiliadRace.Current - 1;
		if (chiliadDone.Current == 1)
			raceDone = 3;
		return vars.TrySplit("Chiliad Challenge #"+raceDone);
	}

	// Import/Export Lists
	//====================
	// The three lists all contain 10 vehicles, which have their exported state
	// stored in an array, so basicially 10 values that change from 0 to 1 when
	// that car is exported. This is per list, so which vehicles the values
	// refer to changes based on which list is active.
	//
	var exportList = vars.watchers["exportList"].Current;
	if (exportList >= 0 && exportList <= 2)
	{
		bool allDone = true;
		bool shouldSplit = false;
		int vehicleId = 0;
		for (int i = 0; i < 10; i++)
		{
			// Check if this vehicle has just been exported
			var vehicle = vars.watchers["export"+i];
			if (vehicle.Current == 1 && vehicle.Old == 0)
			{
				shouldSplit = true;
				vehicleId = i;
			}
			// If one vehicle wasn't exported, the list can't be all done
			if (vehicle.Current == 0) {
				allDone = false;
			}
		}
		if (shouldSplit)
		{
			if (vars.TrySplit("Export "+vars.exportLists[exportList][vehicleId]))
			{
				return true;
			}
			if (allDone && vars.TrySplit("Export List "+(exportList+1)+" Complete"))
			{
				return true;
			}
		}
	}
}

start
{
	//=============================================================================
	// Starting Timer
	//=============================================================================

	var playingTime = vars.watchers["playingTime"];
	var started = vars.watchers["started"];
	var intro_state = vars.watchers["intro_state"];
	var loading = vars.watchers["loading"];

	/*
	 * Note:
	 * Tried to check which menu is selected, which at New Game usually seems to be 6, but doesn't really
	 * seem to work with the Steam version, so that was removed. (1.0 0x7A68A5, Steam 0x5409BC)
	 */

	// New Game
	//=========
	// intro_state is a variable only used in the intro mission, changing from
	// 0 to 1 when the cutscene is skipped. It gets set to other values during the
	// intro cutscene, so the timer will only start when you skip the cutscene
	// within the first 90s or so.
	//
	// Since the value seems to stay at 1 until after, but not sometime later in
	// the game, loading a Save can sometimes trigger New Game, so also check if
	// playingTime is low enough (60s).
	//
	if (intro_state.Current == 1 && intro_state.Old == 0 && playingTime.Current < 60*1000)
	{
		if (settings.StartEnabled)
		{
			// Only output when actually starting timer
			vars.DebugOutput("New Game"+playingTime.Current);
		}
		return true;
	}

	// Loaded Save
	//============
	// Optional starting the timer when loading a save. The "loading" value seems
	// to only be true when loading a game initially (so not loading screens during
	// the game).
	//
	if (settings["startOnSaveLoad"] && !loading.Current && loading.Old)
	{
		if (settings.StartEnabled)
		{
			vars.DebugOutput("Loaded Save");
		}
		return true;
	}
}

reset
{
	//=============================================================================
	// Resetting Timer
	//=============================================================================

	var playingTime = vars.watchers["playingTime"];
	/*
	 * Check if playing time is in the range where the New Game is still starting (before
	 * intro cutscene) but the timer hasn't started yet. This ensures that the timer is
	 * only reset at the very start of the game and not when loading a save or mid-game.
	 * 
	 * Trying to check playingTime == 0 can be dangerous because when loading a save values
	 * may be 0 for a bit. In addition, when starting the game, the value may not actually
	 * be 0.
	 *
	 * Waiting until just before the first cutscene gives the runner some time to ESC and
	 * prevent the reset if he accidentally started a New Game during a run.
	 */
	if (playingTime.Current > 4000 && playingTime.Current < 4100)
	{
		if (settings.ResetEnabled)
		{
			// Only output when actually resetting
			vars.DebugOutput("Reset");
		}
		return true;
	}
}

