package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxAngle;

class Player extends FlxSprite {
    public function new() {
        super();
        loadGraphic("assets/images/Player.png");       
        scale.x=0.1;
        scale.y=0.1;
        x=200;
        y=300;
        updateHitbox();
    }

    override public function update(elapsed:Float):Void{
        super.update(elapsed);

        var up:Bool = FlxG.keys.anyPressed([UP, W]);
		var down:Bool = FlxG.keys.anyPressed([DOWN, S]);
		var left:Bool = FlxG.keys.anyPressed([LEFT, A]);
		var right:Bool = FlxG.keys.anyPressed([RIGHT, D]);

        if (up && down)
			up = down = false;
		if (left && right)
			left = right = false;
			
		if (up)
			velocity.y = -300;
		else if (down)
			velocity.y = 300;
		else
		    velocity.y = 0;
			
		if (left)
			velocity.x = -300;
		else if (right)
			velocity.x = 300;
		else
			velocity.x = 0;

		if(x<0){
			x=0;
		}
		if(y<0){
			y=0;
		}
		if(x>FlxG.width){
			x=FlxG.width;
		}
		if(y>FlxG.height){
			y=FlxG.height;
		}

        angle = FlxAngle.degreesBetweenMouse(this)+90;
    }
}