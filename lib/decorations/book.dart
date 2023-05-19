import 'package:bonfire/bonfire.dart';
import 'package:dracula_game/utils/database.dart';

import '../dracula_game.dart';
import '../players/hero.dart';

class BookDecoration extends GameDecoration with Sensor, DatabaseConnecting {
  BookDecoration(Vector2 position) : super.withSprite(sprite: Sprite.load('draculatiles/items/book.png'), position: position, size: Vector2(tileSize, tileSize)){
    setupSensorArea(
        areaSensor: [
          CollisionArea.rectangle(size: Vector2(tileSize, tileSize), align: Vector2(0, 0))
        ]
    );
  }

  @override
  void onContact(GameComponent component) {
    if (component is HeroPlayer ) {
      print('player position : ${component.absolutePosition}');
      save(position);
      removeFromParent();
    }
  }
}