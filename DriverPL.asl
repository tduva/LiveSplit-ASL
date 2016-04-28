state ("DriverParallelLines")
{
	string20 mission : 0x2E72BC;
}

startup
{
	settings.Add("missionStart", true, "Start of Mission", null);
	settings.SetToolTip("missionStart",
		@"Splits at the start of a mission (when the Briefing/Cutscene comes up).
For most missions, this will also split when you select the 'Lowdown' from the map.");
	settings.Add("missions1978", true, "1978", "missionStart");
	settings.Add("missions2006", true, "2006", "missionStart");

	settings.CurrentDefaultParent = "missions1978";
	settings.Add("mission_1_2.xmv", true, "Wheelman");
	settings.Add("mission_1_3.xmv", true, "Gunman");
	settings.Add("mission_1_35.xmv", true, "Pay Ray");
	settings.SetToolTip("mission_1_35.xmv", "Mission starts automatically after Gunman");
	settings.Add("mission_1_4.xmv", true, "Hot Wheels");
	settings.Add("mission_2_3.xmv", true, "Repoman");
	settings.Add("mission_2_1.xmv", true, "Bread Run");
	settings.Add("mission_2_2.xmv", true, "Last Chance");
	settings.Add("mission_3_1.xmv", true, "Rosalita Racer");
	settings.Add("mission_4_1.xmv", true, "Paddy Wagon");
	settings.Add("mission_4_2.xmv", true, "Turning the Screw");
	settings.Add("mission_5_1.xmv", true, "Air Mail");
	settings.Add("mission_4_3.xmv", true, "Jail Break");
	settings.Add("mission_3_2.xmv", true, "Curcuit Breaker");
	settings.Add("mission_6_3.xmv", true, "Gift Wrapped");
	settings.Add("mission_7_1.xmv", true, "Kidnap");
	settings.Add("mission_7_2.xmv", true, "Ransom");

	settings.CurrentDefaultParent = "missions2006";
	settings.Add("SCENE9.xmv", true, "The Mexican");
	settings.Add("SCENE10.xmv", true, "Tailgate");
	settings.SetToolTip("SCENE10.xmv", "Mission starts automatically after The Mexican");
	settings.Add("mission_9_3.xmv", true, "Riding Shotgun");
	settings.Add("mission_10_2.xmv", true, "Ram Raider (actual Mission)");
	settings.Add("mission_10_3.xmv", true, "Rush Hour");
	settings.Add("mission_9_2.xmv", true, "Gauntlet");
	settings.Add("SCENE13.xmv", true, "Slink");
	settings.Add("Scene12.xmv", true, "Candy");
	settings.Add("mission_11_1.xmv", true, "Gate Crasher");
	settings.Add("mission_12_1.xmv", true, "Home Wrecker");
	settings.Add("mission_12_3.xmv", true, "Bear Cage");
	settings.Add("mission_12_4.xmv", true, "Corrigan");

	settings.CurrentDefaultParent = null;
	settings.Add("other", true, "Other Splits");
	settings.CurrentDefaultParent = "other";
	settings.Add("SCENE3.xmv", false, "Cinematic after Hot Wheels");
	settings.Add("SCENE4.xmv", false, "Cinematic at Safe House available");
	settings.SetToolTip("SCENE4.xmv", "Occurs after Repoman, Bread Run or Last Chance (depending on play order)");
	settings.Add("SCENE5.xmv", false, "Cinematic after last mission of Jail Break set of missions");
	settings.Add("SCENE6.xmv", false, "Cinematic after Gift Wrapped");
	settings.Add("SCENE7.xmv", false, "Cinematic after Kidnap");
	settings.Add("SCENE8.xmv", false, "Cinematic after Ransom");
	settings.Add("SCENE8b.xmv", false, "Cinematic start of 2006");
	settings.Add("Scene11.xmv", false, "Cinematic at the end of Tailgate");
	settings.Add("SCENE14.xmv", false, "Cinematic before Bishop comes available");
	settings.Add("SCENE15.xmv", false, "Cinematic after Bishop");
	settings.Add("SCENE16.xmv", true, "Final Cutscene");
	settings.Add("CREDITS.xmv", false, "Credits");


	Action<string> DebugOutput = (text) => {
		print("[DPL Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;
}

init 
{
	// Already split splits during this attempt (until timer reset)
	vars.split = new List<string>();

	// Track timer phase
	vars.PrevPhase = null;

	Func<string, bool> TrySplit = (splitId) => {
		vars.DebugOutput(splitId);
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
}

update
{
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
}

split
{
	if (current.mission != old.mission)
	{
		if (vars.TrySplit(current.mission))
		{
			return true;
		}
	}
}
