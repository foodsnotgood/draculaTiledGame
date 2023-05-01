import 'package:bonfire/bonfire.dart';
import 'package:dracula_game/dracula_game.dart';
import 'package:flutter/material.dart';

class TorchDecoration extends GameDecoration with Lighting{
  TorchDecoration(Vector2 position)
  :super.withAnimation(animation: 
      SpriteAnimation.load(
        'draculatiles/items/torch_spritesheet.png'
      , 
      SpriteAnimationData.sequenced(amount: 4, stepTime: 0.1, textureSize: Vector2(16, 16))
      )
      , position: position, size: Vector2(40, 40)) {
    setupLighting(
      LightingConfig(radius: width * 5, color: Colors.deepOrangeAccent.withOpacity(0.2), blurBorder: width* 10, withPulse: true, pulseSpeed: 2, pulseVariation: 0.1)
    );
  }
}