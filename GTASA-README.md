# GTA:SA Autosplitter

I created this Autosplitter because I wanted to have one in LiveSplit directly and am interested in how this stuff works.

Since this is still a Work in Progress, not everything may work correctly yet. You can run [DebugView](https://technet.microsoft.com/en-us/Library/bb896647.aspx) to see debug output of the script live as you test it.

## Features

* Auto start (on skipping the first cutscene)
* Auto reset (starting a New Game, during the `Francis INTL. Airport` text, if you start a New Game by accident you have a few seconds to ESC before that)
* Autosplit available for:
  * All Main Story Missions (any%)
  * Most Sidemissions (All Missions/100%)
    - Heists
    - Vehicle Submissions
    - Asset Missions
    - Races/Challenges/Stadium Events
    - Import/Export
    - Schools
  * Busted-/Deathwarps
    - Badlands (before/after Tanker Commander, Body Harvest)
    - San Fierro (after The Da Nang Thang)
  * Collectibles (split on each/all of type completed)
  * Properties (when buying)
  * End of any% (Firetruck Cutscene)
  * No split for 100% so you'll have to split at the end of the last thing you do, for example "End of the Line Part 3" if you split for 100% after the credits on Mission Passed

### Compatibility

* Most stuff tested for v1.0, v1.01 and current Steam version
* Possibly working for 2.0, Steam 3.0 and Steam 1.01
* Check the Autosplitter settings to check which version it detected (while the game is running)
  - If it says `<unknown>` it couldn't detect your game version and the Autosplitter is disabled

## Usage

Simply go into the Splits Editor, set `Grand Theft Auto: San Andreas` as game and activate the Autosplitter by clicking on `Activate`.

As a general rule, you should always have the usual split keys (split/reset/undo/skip) configured, both if the Autosplitter doesn't work correctly or if you need to do something manually during a run for some other reason.

### Settings

In the Splits Editor, click on `Settings` to change what splits are activated.

By default almost all missions are split. Your splits have to match exactly what is split. Each split is only split once, until you reset the timer.

Missions that are activated, but that you don't actually do in game shouldn't cause any issues. So for example if you do any% but have the Driving School split enabled, it shouldn't do anything unless you actually complete Driving School.

If you deactivate the parent of a branch (e.g. uncheck `Collectibles`), then all the splits in that branch will be deactivated as well (even if their checkboxes are still checked), which is indicated by them being grayed out.

The settings are stored in your Splits file if you activated the Autosplitter in the Splits Editor. So make sure to save the splits after you edited the settings.

*Tip:* Right-click on individual settings to open a context menu with some useful options to check/uncheck settings and expand/collapse branches.

#### Duping

If you do duping, make sure to deactivate the split for the mission that you dupe, so that it splits for the mission that you skip, since it will end up on that value.

### Add Autosplitter to Layout

If you don't want or can't activate the script in the Splits Editor, you can add it manually.

First, [download the script](https://raw.githubusercontent.com/tduva/LiveSplit-ASL/master/GTASA.asl). Then edit your Livesplit Layout, add a Scriptable Autosplitter, edit it's settings and select the script you downloaded.

If you choose this way, the settings are stored in the Layout file.

## More Information

* Read the [Livesplit Autosplitter Documentation](https://github.com/LiveSplit/LiveSplit/blob/master/Documentation/Auto-Splitters.md) for information on how Autosplitter scripts work
* Read the comments in the [GTASA.asl](https://raw.githubusercontent.com/tduva/LiveSplit-ASL/master/GTASA.asl) if you are interested in how it works and what addresses it uses
