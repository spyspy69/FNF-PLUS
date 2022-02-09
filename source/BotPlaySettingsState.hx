package;

import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxSubState;
import flixel.FlxG;
import Main;

class BotPlaySettingsState extends FlxSubState
{
	var text:FlxText;
    var text2:FlxText;
	public function new()
	{
		super();
        text = new FlxText(0,0,FlxG.width,"BOTPLAY is: " + Main.botplay);
		text.setFormat(null,62,FlxColor.WHITE,FlxTextAlign.CENTER);
		add(text);
        text2 = new FlxText(0,64,FlxG.width,"true = on\n false = off");
        text2.setFormat(null,62,FlxColor.WHITE,FlxTextAlign.CENTER);
		add(text2);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.keys.pressed.ESCAPE)
		{
			text.destroy();
            text2.destroy();
			FlxG.state.closeSubState();
			FlxG.state.openSubState(new OptionsSubState());
		}
	}
}
