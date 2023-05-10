import 'package:bonfire/bonfire.dart';
import 'package:dracula_game/dracula_game.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../players/hero.dart';

class TorchDecoration extends GameDecoration with Lighting, Sensor{
  TorchDecoration(Vector2 position)
  :super.withAnimation(animation: 
      SpriteAnimation.load(
        'draculatiles/items/torch_spritesheet.png'
      , 
      SpriteAnimationData.sequenced(amount: 4, stepTime: 0.1, textureSize: Vector2(16, 16))
      )
      , position: position, size: Vector2(40, 40)) {
    // setupLighting(
    //   LightingConfig(radius: width * 5, color: Colors.deepOrangeAccent.withOpacity(0.2), blurBorder: width* 10, withPulse: true, pulseSpeed: 2, pulseVariation: 0.1)
    // );
    setupSensorArea(
      areaSensor: [
        CollisionArea.rectangle(size: Vector2(tileSize, tileSize), align: Vector2(0, 160))
      ]
    );
  }
  @override
  void onContact(GameComponent component
      ) {
    if (component is HeroPlayer && (component).collectibles.contains(kCandleCollectible)) {
      setupLighting(
          LightingConfig(radius: width * 5, color: Colors.deepOrangeAccent.withOpacity(0.2), blurBorder: width* 10, withPulse: true, pulseSpeed: 2, pulseVariation: 0.1)
      );
    }
  }
}