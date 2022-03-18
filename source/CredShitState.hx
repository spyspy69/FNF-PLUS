package;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxSubState;
import flixel.FlxG;
import Main;

class CredShitState extends FlxSubState
{
	var text:FlxText;
    var text2:FlxText;
	var text3:FlxText;
	var text4:FlxText;
	var text5:FlxText;
	var text6:FlxText;
	public function new()
	{
		super();
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);
        text = new FlxText(0,0,FlxG.width,"---Base Engine---\nninjamuffin99 - Base Engine Maker\nPhantomArcade3K andEvilsk8r - Art\n Kawaisprite - art\nthank you for making the base FNF");
		text.setFormat(null,12,FlxColor.BLACK,FlxTextAlign.CENTER);
		add(text);
		text2 = new FlxText(0,80,FlxG.width,"---File Hosters---\nGamebanana - hosting the compiled game files\n");
		text2.setFormat(null,12,FlxColor.BLACK,FlxTextAlign.CENTER);
		add(text2);
		text3 = new FlxText(0,128,FlxG.width,"and thank you for playing this");
		text3.setFormat(null,12,FlxColor.BLACK,FlxTextAlign.CENTER);
		add(text3);
		text5 = new FlxText(0,192,FlxG.width,"---friends---\nthank you to mateomaj and pacifickaiju for being my only form of Emotional Support");
		text5.setFormat(null,12,FlxColor.BLACK,FlxTextAlign.CENTER);
		add(text5);
		text4 = new FlxText(0,256,FlxG.width,"press \"esc\" to go back");
		text4.setFormat(null,12,FlxColor.BLACK,FlxTextAlign.CENTER);
		add(text4);
		text5 = new FlxText(0,336,FlxG.width,"thank you\n-nilon");
		text5.setFormat(null,12,FlxColor.BLACK,FlxTextAlign.CENTER);
		add(text5);
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
			FlxG.state.closeSubState();
			FlxG.switchState(new MainMenuState());
		}
	}
}
