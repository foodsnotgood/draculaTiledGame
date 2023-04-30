import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:dracula_game/constants.dart';
import 'package:dracula_game/players/knight.dart';

class KnightInterface extends GameInterface {
  late Sprite candleCollectible;

  @override
  Future<void> onLoad() async {
    candleCollectible =
        await Sprite.load('draculatiles/RF_Catacombs_v1.0/candleA_01.png');
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    try {
      // draw collectible
      _drawCollectible(canvas);
    } catch (e) {}
    super.render(canvas);
  }

  void _drawCollectible(Canvas canvas) {
    if (gameRef.player != null &&
        (gameRef.player as Knight).collectibles.contains(kCandleCollectible)) {
      candleCollectible.renderRect(
          canvas, const Rect.fromLTWH(20, 50, 30, 35));
    }
  }
}
