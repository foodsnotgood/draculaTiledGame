import 'package:bonfire/bonfire.dart';
import 'package:dracula_game/dracula_game.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../players/knight.dart';

class ColumnDecoration extends GameDecoration with ObjectCollision {
  ColumnDecoration(Vector2 position, Vector2 size) : super.withSprite(
      sprite: Sprite.load('draculatiles/items/column.png'),
      position: position,
      size: Vector2(tileSize , tileSize * 5)){
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              tileSize,
              tileSize * 0.6,
            ),
            align: Vector2(
                0 , size.y - tileSize * 0.6
            ),
          ),
        ],
      ),
    );
  }
}