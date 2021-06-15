// Autosplitter for RVGL version 20.0930a
// Made by DVark09
state ("rvgl")
{
	byte Loading : 0x12D75E9; //Bool, shows if the game is loading (BYTE!)
	int stuntStars : 0xB40A90; //Counts the stars taken from stunt arena
	int stuntMax: 0xB40A94; //Stores the maximum star count in the currently open arena. Useful for custom arenas but works fine with the stock arena aswell.
	int championshipLapCounter: 0x12F6338; //Indicated the max laps on championships and on regualar races aswell
	int lapCounter: 0x64EDE18; //Indicates the number of laps you completed. Starts from 0
	byte folder: 0xB3D0DC; //Indicates if the user is in main menu
	//Folder examples: (BYTE!)
	// Menu: 0
	// NHood1: 110
	// SM2: 109
	// Botanical: 103
	byte Nhood1: 0x25DC78; // These below are definitions for the progress table for each map. Max value is 63, min value is 0. Addresses are in this order exaclty.
	byte SM2: 0x25DCF0;
	byte MS2: 0x25DD68;
	byte BG: 0x25DDE0;
	byte Roof: 0x25DE58;
	byte TW1: 0x25DED0;
	byte GT1: 0x25DF48;
	byte TW2: 0x25DFC0;
	byte Nhood2: 0x25E038;
	byte TT1: 0x25E0B0;
	byte MS1: 0x25E128;
	byte SM1: 0x25E1A0;
	byte GT2: 0x25E218;
	byte TT2: 0x25E290;
}
startup
{
	settings.Add("AllCups", true, "All Cups");
	settings.Add("StuntArena", false, "Stunt Arena");
	settings.Add("100%", false, "100%");
	settings.Add("NG+", false, "NG+", "AllCups");
}
init
{
	vars.split=0; //Important for knowing where are you currently in the run to avoid double splitting at the end of cups on 100%.
	//Setting up the check criteria for 100% (comparing each row in the progress table by reffering it with its name):
	vars.mapNames = new List<string> { "Nhood1", "SM2", "MS2", "BG", "Roof", "TW1", "GT1", "TW2", "Nhood2", "TT1", "MS1", "SM1", "GT2", "TT2" };
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
}
split
{
	if(settings["100%"])
	{
		if(current.Nhood1>=32 && old.Nhood1<32 || current.GT1>=32 && old.GT1<32 || current.Nhood2>=32 && old.Nhood2<32 || current.SM1>=32 && old.SM1<32) //Checks if you're not at the and of any cup(avoids double splitting)
		{}//does nothing
		else
		{
			var c = current as IDictionary<String, Object>;
			var o = old as IDictionary<String, Object>;
			foreach(string map in vars.mapNames)
			{    
				if((byte) c[map]>(byte) o[map]) //Splits if the progress table gets added a progress
				{
					vars.split+=1;
					return true;
				}
			}
		}
		if(current.stuntStars==20 && old.stuntStars==19)
		{
			vars.split+=1;
			return true;
		}
	}
	if(settings["100%"] || settings["AllCups"])
	{
		if(settings["NG+"])
		{
			if(current.lapCounter==current.championshipLapCounter && current.lapCounter!=old.lapCounter) //Race has been finished, the right condition is to prevent it from triggering multiple times
			{
				vars.split+=1;
				return true;
			}
		}
		else
		{
			if(current.championshipLapCounter==1)
			{
				//does nothing, only applies when doing single races in 100% (to avoid double splitting)
			}
			else
			{
			if(current.lapCounter==current.championshipLapCounter && current.lapCounter!=old.lapCounter) //Race has been finished, the right condition is to prevent it from triggering multiple times
			{
					vars.split+=1;
					return true;
			}
			}
		}
	}
	if(settings["StuntArena"])
	{
		if(current.stuntStars==current.stuntMax && current.stuntStars!=0)
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
			if(settings["NG+"])
			{
				//no auto reset for NG+ due to any cup order
			}
			else
			{
				if(current.folder==0)
				{
					if(vars.split!=4 && vars.split!=8 && vars.split!=12)
					{
						return true;
					}
				}
			}
		}
		var c = current as IDictionary<String, Object>;
		var o = old as IDictionary<String, Object>;
        foreach(string map in vars.mapNames)
        {    
			if((byte) c[map]<(byte) o[map]) //Resets if the progress table gets reset
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