package;

import Discord.DiscordClient;
import haxe.macro.Expr.Catch;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import legacyshit.PathsLeg;
import sys.FileSystem;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.text.FlxText;
import LoadMods;
import legacyshit.PathsLeg;

class ReadMods extends MusicBeatState
{
    public var mods:Array<String> = FileSystem.readDirectory("mods");
	var grpmodtext:FlxTypedGroup<FlxText>;
	var curSelected:Int = 1;
	var doshit:Bool = true;
	override function create()
	{
		super.create();
		DiscordClient.changePresence("Choosing a mod | FNF PLUS", null);
		mods.insert(0, "Possible Mods:");
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(PathsLeg.image('menuBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);
		grpmodtext = new FlxTypedGroup<FlxText>();
		add(grpmodtext);
        trace(mods);
		if(doshit = true){
			try{
        		for(i in 0...mods.length){
        		    var modtext:FlxText = new FlxText(20, 20 + (i * 50), 0, mods[i], 32);
					if(StringTools.contains(mods[i], ".txt")){
						modtext.ID = i;
					}else{
						grpmodtext.add(modtext);
						modtext.ID = i;
					}

        		}
			}catch(e){
				trace("shit");
			}
		}
	}

	override function update(elapsed:Float)
	{
		grpmodtext.forEach(function(txt:FlxText)
			{
				txt.color = FlxColor.BLACK;
	
				if (txt.ID == curSelected)
					txt.color = FlxColor.BLUE;
			});
		if (controls.BACK)
		{
			FlxG.switchState(new MainMenuState());
		}
		if(controls.ACCEPT)
			{
				var SHITstuff:String = mods[curSelected];
				Main.modName = SHITstuff;
				FlxG.switchState(new LoadMods());
			}
		if (controls.UP_P)
			curSelected -= 1;
		if (controls.DOWN_P)
			curSelected += 1;
		if (curSelected < 1)
			curSelected = mods.length - 1;
		if (curSelected >= mods.length)
			curSelected = 1;
		super.update(elapsed);
	}

}
