import 'package:bonfire/bonfire.dart';
import 'package:dracula_game/dracula_game.dart';
import 'package:dracula_game/players/knight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Draculas castle',
      home: DraculaGame(),
    );
  }
}