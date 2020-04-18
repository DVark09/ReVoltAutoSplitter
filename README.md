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

Soon!... Going to figure out if I can identify similarities in IDA between different versions. If that works, I will update this section with proper information

## I have a question...
Contact me on Discord: DVark09#7856

Any ideas/questions are appreciated!
