package;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxSubState;
import flixel.FlxG;
import Main;

class FridayState extends FlxSubState
{
	var text:FlxText;
	public function new()
	{
		super();
        text = new FlxText(0,0,FlxG.width,"ITS FRIDAY!\npress ESC to continue!");
		text.setFormat(null,64,FlxColor.WHITE,FlxTextAlign.CENTER);
		add(text);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.keys.pressed.ESCAPE)
		{
			/*
			text.destroy();
			text2.destroy();
			text3.destroy();
			text4.destroy();
			text5.destroy();
			*/
            Main.triggered = true;
			FlxG.state.closeSubState();
			FlxG.switchState(new MainMenuState());
		}
	}
}
