import 'package:bonfire/bonfire.dart';
import 'package:dracula_game/spritesheets/playerSpriteSheet.dart';

class Knight extends SimplePlayer with ObjectCollision{
  Knight(Vector2 position)
      : super(
    position: position,
    size: Vector2(32,32),
    animation: PlayerSpriteSheet.simpleDirectionAnimation,
  ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(size: Vector2.all(32)),
        ],
      ),
    );
  }
}