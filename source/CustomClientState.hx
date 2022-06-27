package;

import openfl.ui.Keyboard;
import MainMenuState.MainMenuState.versionnum;
import flixel.FlxG;
import legacyshit.PathsLeg;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.app.Application;

class CustomClientState extends MusicBeatState
{
	public static var leftState:Bool = false;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"HEY! You're running a version of FNF Plus that isn't stock!\nthe developer asks for you to stay safe "
			+ "\nenjoy the game nonetheless\n"
			+ "press any key to continue!",
			32);
		txt.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		txt.screenCenter();
		add(txt);
	}

	override function update(elapsed:Float)
	{
		if (FlxG.keys.anyPressed([ANY]))
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
