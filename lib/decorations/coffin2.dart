import 'package:bonfire/bonfire.dart';
import 'package:dracula_game/dracula_game.dart';
import 'package:dracula_game/utils/database.dart';

import '../players/hero.dart';

class Coffin2 extends GameDecoration with ObjectCollision {
  Coffin2(Vector2 position, Vector2 size) :
        super.withSprite(sprite: Sprite.load('draculatiles/items/coffin_h2.png'), position: position, size: size) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              size.x, size.y/2,
            ),
            align: Vector2(
                0 , size.y/2
            ),
          ),
        ],
      ),
    );
  }
}