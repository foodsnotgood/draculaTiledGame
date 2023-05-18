import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:dracula_game/constants.dart';
import 'package:dracula_game/decorations/book.dart';
import 'package:dracula_game/decorations/candle.dart';
import 'package:dracula_game/decorations/coffin1.dart';
import 'package:dracula_game/decorations/coffin2.dart';
import 'package:dracula_game/decorations/column.dart';
import 'package:dracula_game/decorations/torch.dart';
import 'package:dracula_game/interface/knight_interface.dart';
import 'package:dracula_game/players/hero.dart';
import 'package:dracula_game/utils/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'collisions/wall.dart';

double tileSize = 16;

class DraculaGame extends StatefulWidget {
  const DraculaGame({Key? key}) : super(key: key);

  @override
  State<DraculaGame> createState() => _DraculaGameState();
}

class _DraculaGameState extends State<DraculaGame>
    with DatabaseConnecting
    implements GameListener {
  late GameController _controller;
  bool showGameOver = false;
  bool showGameWon = false;
  bool saved = false;
  Vector2 startingPosition = Vector2(0, 0);

  @override
  void initState() {
    super.initState();
    _controller = GameController()..addListener(this);
  }

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    tileSize = max(sizeScreen.height, sizeScreen.width) / 15;

    return FutureBuilder(
        future: loadPosition("Johannes"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BonfireWidget(
              gameController: _controller,
              joystick: Joystick(
                keyboardConfig: KeyboardConfig(),
                directional: JoystickDirectional(),
              ),
              interface: KnightInterface(),
              player: HeroPlayer(snapshot.data!),
              // showCollisionArea:true,
              map: WorldMapByTiled('draculascastletiles/map/mainmap.json',
                  forceTileSize: Vector2(tileSize, tileSize),
                  objectsBuilder: {
                    kCandleCollectible: (p) => CandleCollectible(p.position),
                    kWallCollision: (p) => Wall(p.position, p.size),
                    kColumn: (p) => ColumnDecoration(p.position, p.size),
                    kTorch: (p) => TorchDecoration(p.position),
                    kCoffin1: (p) => Coffin1(p.position, p.size),
                    kCoffin2: (p) => Coffin2(p.position, p.size),
                    kBook: (p) => BookDecoration(p.position),
                  }),
              lightingColorGame: Colors.black.withOpacity(0.6),
              background: BackgroundColorGame(Colors.grey[900]!),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  @override
  void changeCountLiveEnemies(int count) {
    // TODO: implement changeCountLiveEnemies
  }

  @override
  void updateGame() {
    // TODO: implement updateGame
  }
}
