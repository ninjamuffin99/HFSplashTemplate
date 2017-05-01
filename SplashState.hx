package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ...
 */
class SplashState extends FlxState 
{
	private var _times:Array<Float>;
	private var _curPart:Int = 0;
	private var _functions:Array<Void->Void>;
	
	override public function create():Void 
	{
		FlxG.fixedTimestep = false;
		
		//These are when the flixel notes/sounds play, you probably shouldn't change these if you want the functions to sync up properly
		_times = [0.041, 0.184, 0.334, 0.495, 0.636];
		//An array of functions to call after each time thing has passed
		_functions = [addText1, addText2, addText3, addText4, addText5];
		
		for (time in _times)
		{
			new FlxTimer().start(time, timerCallback);
		}
		
		//put the included flixel.mp3 into your assests folder in your project
		FlxG.sound.play("assets/sounds/flixel.mp3", 1, false, null, true);
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		//Thing to skip the splash screen
		
		if (FlxG.keys.justPressed.SPACE || FlxG.mouse.justPressed)
		{
			finishSound();
		}
		
		super.update(elapsed);
	}
	
	private function timerCallback(Timer:FlxTimer):Void
	{
		_functions[_curPart]();
		_curPart++;
		
		if (_curPart == 5)
		{
			FlxG.camera.fade(FlxColor.BLACK, 3.25, false, finishTween);
		}
	}
	
	private function addText1():Void
	{
		//stuff that happens
	}
	
	private function addText2():Void
	{
		//stuff that happens
	}
	
	private function addText3():Void
	{
		//stuff that happens
	}
	
	private function addText4():Void
	{
		//stuff that happens
	}
	
	private function addText5():Void
	{
		//stuff that happens
	}
	
	private function finishTween():Void
	{
		FlxG.switchState(new MenuState());
	}
	
}