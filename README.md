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

## How do I use it?
You go to Livesplit and right click on the splits, go to edit splits. There You'll see a text below "Start timer at". To the right, there is an "Activate" button. You press that, and after that's done you go to the settings menu. From there, you can select in advanced options which run you are doing. Select the desired option (All Cups AND NG+ for NG+) and you're good to go.

On how to set up your livesplit layout/splits you could use my presets or watch this video which explains everything you need to know: https://youtu.be/xq2MCodtH34

Splits:

All Cups: You have to have every level as a split, and if you want it to be fancy you can use subsplits. I included my own layout in the files to see how it works. The image shows example with subsplits used. For All Cups NG+, use the same as you would use for All Cups, but make it in the order as you wish.
![alt Example splits](https://dani30868.s-ul.eu/UqTWDwW5) 


Stunt Arena: Create just a single split. That's all.

100%: You have to create individual split for everything (practice stars, individual races, time attacks and championships) in the order of your liking. I suggest using subsplits to make it look fancy. I also have example and it has it set to the best route.

You also have to have 2 timers: one for real time, and one for game time.
By the end it should look like this in the layout editor
No need for scriptable auto splitter in the layout anymore!

![alt text](https://dani30868.s-ul.eu/YzQRQigq)

## Known issues
The autosplitter only works with a 64 bit version of Windows 10 and a 64 bit version of rvgl! To see which is the latest supported version check the discord server's welcome channel.

Another known issue seems to be with the location of livesplit. The common download folder of W10 (C:\users\username\Downloads\...) might break the autosplitter so either try running Livesplit as an Administrator or move the folder out of your downloads folder.

If you seem to have an issue that isn't realated to these, download DebugView from here and send me a screenshot of it (after launching livesplit and rvgl): https://docs.microsoft.com/en-us/sysinternals/downloads/debugview

## How to update the splitter (For people who want to contribute)

You can help update this project pretty easily, if you know how to use CE.
You'll need:
    Cheat Engine (version not that important)
    The build you want to create the update for
If you don't know how to use CE this tutorial should help: https://www.youtube.com/watch?v=Mj1bnmWAadc

If you know how to use CE here's how to find all the addresses:
Loading: Any track loading (when loading value is 1, otherwise 0 [4Byte])
StuntStars: get 2-3 stars on the map or just switch betveen profiles and search for star ammount [4 byte]
ChampionshipLapCounter: Start bronze (value 3) and silver cup (value 6), repeat until found address [4Byte]
LapCounter: Do one-two laps on a map and check for these values [4Byte]:
	Lap 1: 0
	Lap 2: 1
	...
Folder examples [BYTE]!: 
	Menu 0
	Nhood1 110
	SM2 109
	Botanical 103
Progress table: Switch between a fully done progress table (Rooftops INCLUDED!) and a clear profile. Search for [BYTE!] 63 in first and 0 in the second case. 14 addresses with green indicators should be on the top of the list. Those will be the maps in the order as you can see them on the progress table.

After you've found every address you'll need to put them into rvgl.asl.
When you have the addresses in your list at the bottom section, double click on the address for one of them. That should show up a window where you'll see the address which you'll need to put into the other file.
The required part is after rvgl.exe+, so in the picture the required info is B23BF0.

![alt exact address example](https://dani30868.s-ul.eu/cLRhP8ia)

In rvgl.asl, you need to put this into the respective line where that variable is declared. BUT you don't need to remove the 0x part in it, just replace the part after that and before the semicolon to the found address (going on from the example now it should be 0xB23BF0; [don't remove semicolon!])

Repeat this process for every address until you have changed every variable's pointer.

After this, you can issue a pull request with your updated version.

## I have a question...
Contact me on Discord: DVark09#7856

Any ideas/questions are appreciated!
