package;

import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxSubState;
import flixel.FlxG;

class ControlsSubState extends FlxSubState
{
	var text:FlxText;
	public function new()
	{
		super();
		text = new FlxText(0,0,FlxG.width,"keybinds are [D,F,J,K]");
		text.setFormat(null,64,FlxColor.WHITE,FlxTextAlign.CENTER);
		add(text);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.keys.pressed.ESCAPE)
		{
			text.destroy();
			FlxG.state.closeSubState();
			FlxG.state.openSubState(new OptionsSubState());
		}
	}
}
