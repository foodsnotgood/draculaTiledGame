import 'package:bonfire/bonfire.dart';
import 'package:dracula_game/constants.dart';
import 'package:dracula_game/dracula_game.dart';
import 'package:dracula_game/players/knight.dart';
import 'package:flutter/material.dart';

class CandleCollectible extends GameDecoration with Lighting, Sensor {
  CandleCollectible(Vector2 position) : super.withSprite(
      sprite: Sprite.load('draculatiles/RF_Catacombs_v1.0/candleA_01.png'),
      position: position,
      size: Vector2(tileSize / 2, tileSize / 2)){
    setupLighting(
        LightingConfig(radius: width * 2, color: Colors.deepOrangeAccent.withOpacity(0.2), blurBorder: width*1.5)
    );
  }

  @override
  void onContact(GameComponent component
      ) {
    if (component is Knight && !(component as Knight).collectibles.contains(kCandleCollectible)) {
      component.collectibles.add(kCandleCollectible);
      removeFromParent();
    }
  }
}

