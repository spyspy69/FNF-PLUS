package;

import Discord.DiscordClient;
import Main.modName;
import flixel.FlxG;
import legacyshit.PathsLeg;
import sys.io.File;
import sys.FileSystem;
import haxe.Json;

class LoadMods extends MusicBeatState
{
	override function create()
	{
		super.create();
		DiscordClient.changePresence("Loading mod \"" + modName + "\" | FNF PLUS", null);
		Main.useModdedAtlas = true;
		trace("ModName= "+Main.modName);
		FlxG.switchState(new MainMenuState());
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	
}
