# ReVoltAutoSplitter
## What's this?
It's an autosplitter, which generalizes splits, making it even and fair to everyone. It also has a load remover to also prevent people with better hardware to save extra time from loads.
## How does this work?
It accesses memory addresses which contain useful information, such as the lap counter, race time and others. Set conditions are written in script for LiveSplit to know what to do at an exact moment.
## What does it do?
All Cups:  It starts the timer and it splits at the end of every race. 
Stunt Arena: It starts the timer when the map has loaded in and stops when you get the final star
## In which categories does this work?
It works in every currently existing category.
## What will this help?
It will help to standardize splits and to have a competition that is accurate and not defected by any matter.
## Would any rule be changed?
The load remover doesn't work with the launch option -sload, so that would be removed.
The rule which allows the user to skip the ceremony by force closing is really considered to be taken out because of the same reasons this autosplitter exists.
Also turning off instances might be removed, but the autosplitter has no relevation in this decision. It saves some time, but it breaks the game's looks.
## What would happen to the older runs?
They would be retimed in the case of load removal, but individual splits for the races might not be implemented for those runs.
## So are we going to use game time from now on to track the runs?
Probably. Before we go on to use it we should agree on this though.
## When is it going to be out?
I think it's done. 1.0 is here, Uploaded to LiveSplit and available through LiveSplit itself. Also downloadable here, but it would be just the same as the one on LiveSplit
## How do I use it?
You first download the files, go to Livesplit and right click on the splits, go to edit layout. Add a new object called Scriptable auto splitter and make the script path point to the downloaded .asl file. From there, you can select in advanced options which run you are doing. Select the desired option (All Cups for NG+ too) and you're good to go.

Splits:
All Cups: You have to have every level as a split, and if you want it to be fancy you have to use subsplits. I included my own layout in the files to see how it works. For Stunt arena, you only have to have one split. The image shows example with subsplits used. For All Cups NG+, use the same as you would use for All Cups, but make it in the order as you wish.
![alt text](https://dani30868.s-ul.eu/qOkm2jAD) 


Stunt Arena: Create just a single split. That's all
100%: You have to create individual split for everything (practice stars, individual races, time attacks and championships) in the order of your liking. I suggest using subsplits to make it look fancy.

You also have to have 2 timers: one for real time, and one for game time.
By the end it should look like this in the layout editor
![alt text](https://dani30868.s-ul.eu/YzQRQigq)

## I have a question...
Contact me on Discord: DVark09#7856

Any ideas/questions are appreciated!
