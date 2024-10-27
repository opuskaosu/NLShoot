package;

import flixel.FlxSprite;
import flixel.math.FlxVelocity;

class PlayerBullet extends FlxSprite
{
	static inline var SPEED:Float = 400;
	public function new(x:Float,y:Float,angle:Float)
	{
		super(x,y);
        makeGraphic(10, 20, 0xFFFFFFFF);
        updateHitbox();
		this.x=x+16;
		this.y=y+32;
		this.angle = angle;
		var velocity: Float;
	}	

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		velocity = FlxVelocity.velocityFromAngle(this.angle-90,SPEED);

		this.velocity.x = velocity.x;
		this.velocity.y = velocity.y;

		if(isOnScreen()==false) {
            kill();
        }
	}
}