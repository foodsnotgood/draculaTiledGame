import 'package:bonfire/bonfire.dart';
import 'package:dracula_game/constants.dart';
import 'package:dracula_game/dracula_game.dart';
import 'package:dracula_game/players/knight.dart';
import 'package:flutter/material.dart';

class CandleCollectible extends GameDecoration with Lighting, Sensor {
  CandleCollectible(Vector2 position)
      : super.withAnimation(
      animation: SpriteAnimation.load(
          'draculatiles/items/candleA_spritesheet.png',
        SpriteAnimationData.sequenced(amount: 4, stepTime: 0.1, textureSize: Vector2(7,14))
      ),
      position: position, size: Vector2(7, 14)){
    setupLighting(
        LightingConfig(radius: width * 4, color: Colors.deepOrangeAccent.withOpacity(0.2), blurBorder: width*1.5)
    );
  }

  @override
  void onContact(GameComponent component
      ) {
    if (component is Knight && !(component).collectibles.contains(kCandleCollectible)) {
      component.collectibles.add(kCandleCollectible);
      removeFromParent();
    }
  }
}
