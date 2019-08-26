state ("rvgl")
{
	int RaceTime : 0x02586B0, 0x0; // Your current lap time
	int Loading : 0xACC51C; //Bool, shows if the game is loading
	int stuntStars : 0x0258440, 0x10; //Counts the stars taken from stunt arena
	int championshipLapCounter: 0x0256AA0, 0x18; //Indicated the max laps on championships
	int lapCounter: 0x0258140, 0xF18; //Indicates the number of laps you completed. Starts from 0
	byte folder: 0x0258460, 0x3C; //Indicates if the user is in main menu
}
startup
{
	settings.Add("AllCups", true, "All Cups");
	settings.Add("StuntArena", false, "Stunt Arena");
	settings.Add("100%", false, "100%");
}
init
{
	vars.split=0; //Important for knowing where are you currently in the run to avoid double splitting at the end of cups on 100%.
	//Setting up the check criteria for 100% (comparing each row in the progress table by reffering it with its name):
	vars.mapNames = new List<string> { "Nhood1", "SM2", "MS2", "BG", "Roof", "TW1", "GT1", "TW2", "Nhood2", "TT1", "MS1", "SM1", "GT2", "TT2" };
	//Setting up the values for checking 100%:
	long Address= memory.ReadValue<int>( IntPtr.Add( modules.First().BaseAddress, (int) 0x0256B10 ) );
	vars.maps = new MemoryWatcherList
    {
        new MemoryWatcher<byte>(  (IntPtr)Address +  0x178 ) { Name = "Nhood1" },
        new MemoryWatcher<byte>(  (IntPtr)Address +  0x1EC ) { Name = "SM2" },
		new MemoryWatcher<byte>(  (IntPtr)Address +  0x260 ) { Name = "MS2" },
        new MemoryWatcher<byte>(  (IntPtr)Address +  0x2D4 ) { Name = "BG" },
		new MemoryWatcher<byte>(  (IntPtr)Address +  0x348 ) { Name = "Roof" },
        new MemoryWatcher<byte>(  (IntPtr)Address +  0x3BC ) { Name = "TW1" },
		new MemoryWatcher<byte>(  (IntPtr)Address +  0x430 ) { Name = "GT1" },
        new MemoryWatcher<byte>(  (IntPtr)Address +  0x4A4 ) { Name = "TW2" },
		new MemoryWatcher<byte>(  (IntPtr)Address +  0x518 ) { Name = "Nhood2" },
        new MemoryWatcher<byte>(  (IntPtr)Address +  0x58C ) { Name = "TT1" },
		new MemoryWatcher<byte>(  (IntPtr)Address +  0x600 ) { Name = "MS1" },
        new MemoryWatcher<byte>(  (IntPtr)Address +  0x674 ) { Name = "SM1" },
		new MemoryWatcher<byte>(  (IntPtr)Address +  0x6E8 ) { Name = "GT2" },
        new MemoryWatcher<byte>(  (IntPtr)Address +  0x75C ) { Name = "TT2" },
		
	};
}
start
{
	if(current.Loading==0 && old.Loading==1 && current.folder!=0) //Checks if any type of race loaded in
	{
		vars.split=0;
		return true;
	}
}
update
{
	vars.maps.UpdateAll(game); //Updates the values of the progress table rows
}
split
{
	if(settings["100%"])
	{
		if(vars.split!=8 && vars.split!=15 && vars.split!=19 && vars.split!=27) //Checks if you're not at the and of any cup(avoids double splitting)
		{
			foreach(string map in vars.mapNames)
			{    
				if(vars.maps[map].Current>vars.maps[map].Old) //Checks if the progress table has changed
				{
					vars.split+=1;
					return true;
				}
			}
		}
		if(current.stuntStars==20 && old.stuntStars==19)
		{
			return true;
		}
	}
	if(settings["100%"] || settings["AllCups"])
	{
		if(current.lapCounter==current.championshipLapCounter && current.lapCounter!=old.lapCounter) //Race has been finished, the right condition is to prevent it from triggering multiple times
		{
			if(settings["100%"])
			{	
				vars.split+=1;
				return true;
			}
			if(settings["AllCups"])
			{
				vars.split+=1;
				return true;
			}
		}
	}
	if(settings["StuntArena"])
	{
		if(current.stuntStars==20)
		{
			return true;
		}
	}
}
isLoading
{
	if(current.Loading==1)
	{
		return true;
	}
	else
	{
		return false;
	}
}
reset
{
	if(settings["100%"] || settings["AllCups"])
	{
		if(settings["AllCups"])
		{
			if(current.folder==0)
			{
				if(vars.split!=4 || vars.split!=8 || vars.split!=12)
				{
					return true;
				}
			}
		}
        foreach(string map in vars.mapNames)
        {    
			if(vars.maps[map].Current<vars.maps[map].Old) //Resets if the progress table gets reset
			{
				return true;
			}
        }
	}
	if(settings["StuntArena"])
	{
		if(current.Loading==1) //Simple check for quitting the race
		{
			return true;
		}
	}
}
