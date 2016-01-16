state("AlanWake")
{
	byte isLoading : "AlanWake.exe", 0x0036BA34;
	byte level : 0x36D8B4, 0x3F0, 0x174;
}

init
{
	Action<string> DebugOutput = (text) => {
		print("[AlanWake Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;
	
	DebugOutput("Initialized");
}

start
{
	if (current.isLoading == 1 && current.level == 1) {
		vars.DebugOutput("Timer started");
		return true;
	}
}

split
{
	if (current.level > old.level) {
		vars.DebugOutput("Split Start of Level "+current.level);
		return true;
	}
}

isLoading
{
	return current.isLoading > 0;
}

