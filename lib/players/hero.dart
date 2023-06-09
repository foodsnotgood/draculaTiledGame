import 'package:bonfire/bonfire.dart';
import 'package:dracula_game/constants.dart';
import 'package:dracula_game/dracula_game.dart';
import 'package:dracula_game/spritesheets/playerSpriteSheet.dart';
import 'package:flutter/material.dart';

import '../utils/functions.dart';

class HeroPlayer extends SimplePlayer with Lighting, ObjectCollision {
  final List<String> collectibles = [];
  double lightradius = 1.5;
  HeroPlayer(Vector2 position)
      : super(
    animation: PlayerSpriteSheet.simpleDirectionAnimation,
    size: Vector2.all(tileSize),
    position: position,
    life: 200,
    speed: tileSize / 0.25,
  ) {
    setupCollision(
        CollisionConfig(
            collisions: [
          CollisionArea.rectangle(
              size: Vector2(
                  valueByTileSize(8),
                  valueByTileSize(8)),
              align: Vector2(
                valueByTileSize(4),
                valueByTileSize(8),
              ))
        ])
    );
  }

  @override
  void update(double dt) {
    if (collectibles.contains(kCandleCollectible)){
      setupLighting(
          LightingConfig(radius: width * lightradius, color: Colors.deepOrangeAccent.withOpacity(0.2), blurBorder: width)
      );
    }
    super.update(dt);
  }
}