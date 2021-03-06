package;

import haxe.exceptions.NotImplementedException;
import lime.text.harfbuzz.HBGlyphPosition;
import haxe.macro.Expr.Position;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.addons.transition.FlxTransitionableState;
import haxe.macro.Context;
import Discord.DiscordClient;

class OptionsSubState extends MusicBeatSubstate
{
	var textMenuItems:Array<String> = ['Controls', 'Disable Input', 'Credits', 'Mods',  'Back'];

	var selector:FlxSprite;
	var curSelected:Int = 0;

	var grpOptionsTexts:FlxTypedGroup<FlxText>;

	public function new()
	{
		super();
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Changing some settings | FNF PLUS", null);
		#end
		grpOptionsTexts = new FlxTypedGroup<FlxText>();
		add(grpOptionsTexts);

		selector = new FlxSprite().makeGraphic(5, 5, FlxColor.RED);
		add(selector);

		for (i in 0...textMenuItems.length)
		{
			var optionText:FlxText = new FlxText(20, 20 + (i * 50), 0, textMenuItems[i], 32);
			optionText.ID = i;
			grpOptionsTexts.add(optionText);
		}
	}
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if(FlxG.keys.pressed.ESCAPE)
			{
				FlxG.state.closeSubState();
				FlxG.switchState(new MainMenuState());
			}
		if (controls.UP_P)
			curSelected -= 1;

		if (controls.DOWN_P)
			curSelected += 1;

		if (curSelected < 0)
			curSelected = textMenuItems.length - 1;

		if (curSelected >= textMenuItems.length)
			curSelected = 0;

		grpOptionsTexts.forEach(function(txt:FlxText)
		{
			txt.color = FlxColor.WHITE;

			if (txt.ID == curSelected)
				txt.color = FlxColor.BLUE;
		});

		if (controls.ACCEPT)
		{
			switch (textMenuItems[curSelected])
			{
				case "Controls":
					FlxTransitionableState.skipNextTransIn = true;
					FlxTransitionableState.skipNextTransOut = true;
					FlxG.switchState(new ControlsSubState());
				case "Back":
					FlxTransitionableState.skipNextTransIn = true;
					FlxTransitionableState.skipNextTransOut = true;
					FlxG.state.closeSubState();
					FlxG.switchState(new MainMenuState()); //or you could press ESC, idk
				case "Disable Input":
					new NotImplementedException("this hasn't been implemented yet");
				case "Credits":
					FlxTransitionableState.skipNextTransIn = true;
					FlxTransitionableState.skipNextTransOut = true;
					FlxG.switchState(new CredShitState()); //trust me, it is shit.
				case "Mods":
						new NotImplementedException("???");
				}
			}
		}
	
}