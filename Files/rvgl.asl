state ("rvgl")
{
	int currentLap : 0x0258140, 0xF18;  // Your current lap(s) in the race
	int maxlapsSingleRace : 0x02174B0, 0x0; // The lapcounter for single races
	int RaceTime : 0x02586B0, 0x0; // Your current lap time
	int championshipLapcount : 0x0256AA0, 0x18; // The lapcounter for the championships
	int Loading: 0xACC51C; //Checks if the game is loading
	int stuntStars : 0x0258440, 0x10; //Counts the stars taken from stunt arena
}
startup
{
	settings.Add("AllCups", true, "All Cups");
	settings.Add("NG+", false, "NG+", "AllCups");
	settings.Add("StuntArena", false, "Stunt Arena");
}
init
{
	vars.once=false;
}
start
{
	vars.once=false;
	if(settings["AllCups"])
	{		
		if(current.championshipLapcount==3)
		{
			return true;
		}
		if(settings["NG+"])
		{
			if(current.championshipLapcount==5 || current.championshipLapcount==6)
			{
				return true;
			}
		}
	}
	if(settings["StuntArena"])
	{
		if(current.RaceTime>0 && current.RaceTime!=4999)
		{
			return true;
		}
	}
}
update
{
	if(current.RaceTime==0 && current.currentLap==0 && vars.once==true)
	{
		//After the new race has started, it resets this value to be able to split again
		vars.once=false;
	}
}
split
{
	if(settings["AllCups"])
	{
		if(current.currentLap==current.championshipLapcount && vars.once==false && current.currentLap!=0)
		{
			vars.once=true; //Helps to only split once after a race.
			return true;
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