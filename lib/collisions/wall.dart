import 'package:bonfire/bonfire.dart';
import 'package:dracula_game/dracula_game.dart';

class Wall extends GameDecoration with ObjectCollision {
  Wall(Vector2 position, Vector2 size) : super(
    position: position,
    size:size
  ) {
    setupCollision(
      CollisionConfig(
        enable: true,
        collisions: [ //required
          CollisionArea.rectangle(
            size: size,
            align: Vector2(0,0),
          ),
        ],
      ),
    );
  }
}