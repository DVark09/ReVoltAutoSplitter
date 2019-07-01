state ("rvgl")
{
	int RaceTime : 0x02586B0, 0x0; // Your current lap time
	int Loading : 0xACC51C; //Bool, shows if the game is loading
	int stuntStars : 0x0258440, 0x10; //Counts the stars taken from stunt arena
}
startup
{
	settings.Add("AllCups", true, "All Cups");
	settings.Add("StuntArena", false, "Stunt Arena");
	settings.Add("100%", false, "100%");
}
init
{
	//Setting up the check for All Cups and 100%:
	vars.mapNames = new List<string> { "Nhood1", "SM2", "MS2", "BG", "Roof", "TW1", "GT1", "TW2", "Nhood2", "TT1", "MS1", "SM1", "GT2", "TT2" };
	//Setting up the values for checking All Cups and 100%:
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
		if(current.Loading==0 && old.Loading==1) //Checks if any type of race loaded in
		{
			return true;
		}
}
update
{
	//Updates the values of the progress table rows
	vars.maps.UpdateAll(game);
}
split
{
	if(settings["100%"] || settings["AllCups"])
	{
        foreach(string map in vars.mapNames)
        {    
        if(vars.maps[map].Current>vars.maps[map].Old) //Checks if the progress table has changed
        {
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
		if(current.RaceTime==0) //Simple check for quitting the race
		{
			return true;
		}
	}
}