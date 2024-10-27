package;

import flixel.FlxSprite;

class Enemy extends FlxSprite
{
	public function new(x:Float,y:Float)
	{
		super();
        loadGraphic("assets/images/Enemy.png");
        scale.x=0.1;
        scale.y=0.1;
        this.x =x;
        this.y =y;
        updateHitbox();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}