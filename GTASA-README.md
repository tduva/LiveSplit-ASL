# GTA:SA Work in Progress Autosplitter

I created this autosplitter because I wanted to have one in LiveSplit directly and am interested in how this stuff works.
While an ASL script is kind of limited (no GUI settings possible yet), it allows for easy editing and experimenting.

Since this is a Work in Progress, it may only work for the 1.0 version of SA and some stuff may not work correctly in general. You can run [DebugView](https://technet.microsoft.com/en-us/Library/bb896647.aspx) to see debug output of the script live as you test it.

## Usage

If you want to use this, you have to manually add it to a LiveSplit Layout. First, [download the script](https://raw.githubusercontent.com/tduva/LiveSplit-ASL/master/GTASA.asl). Then edit your Livesplit Layout, add a Scriptable Autosplitter, edit it's settings and select the script you downloaded.

By default all missions are split as well as some "special" splits like Bustedwarps/Deathwarps in Badlands. Your splits have to match exactly what is split. You can add splits to the blacklist at the top of the file (some are already in there as examples). Make sure you get the syntax right otherwise the script won't load in LiveSplit.

The timer should reset/start automatically when you start a new game and split at the end of any% (unless you added that split to the blacklist).

Each split is only split once, until you reset the timer.

## More Information

* Read the [Livesplit Autosplitter Documentation](https://github.com/LiveSplit/LiveSplit/blob/master/Documentation/Auto-Splitters.md) for information on how Autosplitter scripts work
