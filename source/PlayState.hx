package;

import Enemy;
import Player;
import PlayerBullet;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;


class PlayState extends FlxState
{
	var player: Player;
	var player_bullet: PlayerBullet;
	var enemies: FlxGroup;
	override public function create()
	{
		super.create();
		// FlxG.debugger.visible =true;

		player = new Player();
		add(player);

		enemies = new FlxGroup();
		for (i in 0...5){
			var enemy = new Enemy(100*i,0);
			enemies.add(enemy);
		}
		add(enemies);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.Z) {
			player_bullet = new PlayerBullet(player.x, player.y ,player.angle);
			add(player_bullet);
		}

		FlxG.overlap(player_bullet, enemies, _cbPing);
	}

	private function _cbPing(bullet:FlxSprite, enemy:FlxSprite) {
        enemy.kill();
    }
}
