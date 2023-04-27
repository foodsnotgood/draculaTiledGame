import 'package:bonfire/bonfire.dart';
import 'package:dracula_game/players/knight.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(
        directional: JoystickDirectional(),
      ), // required
      map: WorldMapByTiled('draculamap.json', forceTileSize: Vector2(16.0, 16.0)),
      player: Knight(Vector2(16.0, 16.0)),
      lightingColorGame: Colors.black.withOpacity(0.4), // if you want to add general lighting for the game
      cameraConfig: CameraConfig(moveOnlyMapArea: false, zoom: 1.5),
      backgroundColor: const Color.fromARGB(255, 10, 53, 89),
    );
  }
  
}
