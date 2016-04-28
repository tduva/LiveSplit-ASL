# Driver: Parallel Lines Autosplitter

This Autosplitter supports splitting at the start of most missions (when the mission Briefing/Cinematic comes up). Most missions will also split if you just view the Lowdown from the map, but that shouldn't be a thing in a Speedrun anyway.

You'll have to start/reset the timer manually. The end of the game will by default be split when the last cutscene starts.

Missions that can't be split in a manner consistent to the others are the following (they don't have a Briefing/Cinematic at the start):

* Guardian Angel
* Ram Raider 1 (Ambush part)
* Shell Shock
* Bishop

There are a few additional possible splits available (usually Cinematics) which aren't enabled by default.

## Usage

To use the Autosplitter simply set the game in the Splits Editor as `Driver: Parallel Lines` and click on `Activate`.

## Technical Notes
DriverParallelLines.exe+2E72BC changes to the current mission on start of the mission, as well as the Cutscenes. Some possible values are:

* SCENE1.xmv - Cutscene at the start of the game
* SCENE2.xmv - Cutscene after driving into the garage in the first mission
* mission_1_2.xmv - Wheelman
* mission_1_3.xmv - Gunman
* mission_1_35.xmv - Money thing?
* mission_1_4.xmv - Hot Wheels
* SCENE3.xmv - Cutscene after Hot Wheels
* mission_2_3.xmv - Repoman
* mission_2_1.xmv - Bread Run
* mission_3_1.xmv - Rosalita Racer
* mission_3_2.xmv - Circuit Breaker
* mission_4_1.xmv - Paddy Wagon
* mission_4_2.xmv - Turning the Screw
* mission_4_3.xmv - Jail Break
* mission_5_1.xmv - Rivet Monkey??
* mission_6_3.xmv - Gift Wrapped
* mission_7_1.xmv - Kidnap
* mission_7_2.xmv - Ransom
* mission_2_2.xmv - Last Chance
* SCENE4.xmv - Cutscene after Last Chance (or other missions in that set)
* SCENE5.xmv - Cutscene before Gift Wrapped
* SCENE6.xmv - Cutscene before Kidnap
* SCENE7.xmv - Cutscene after Kidnap
* SCENE8.xmv - Cutscene after Ransom/before Era Change

* mission_8_1.xmv - The Mexican (although only when selecting Lowdown, otherwise the Cinematic seems to overwrite it)
* SCENE8b.xmv - Cutscene at the start of 2006
* SCENE9.xmv - Start of The Mexican
* SCENE10.xmv - After killing The Mexican
* SCENE11.xmv - Cutscene after thingy
* mission_9_3.xmv - Riding Shotgun
* mission_10_2.xmv - Ram Raider (Part 2)
* mission_10_3.xmv - Rush Hour
* mission_9_2.xmv - Gauntlet
* SCENE13.xmv - Cutscene before Slink
* Scene12.xmv - Cutscene beofre Candy
* mission_11_1.xmv - Gate Crasher
* mission_12_3.xmv - Bear Cage
* mission_12_1.xmv - Home Wrecker
* SCENE15.xmv - Cutscene after Bishop
* SCENE16.xmv - Final Cutscene
* CREDITS.xmv - Credits
2 - After Hotwheels
3 - After Last Chance
