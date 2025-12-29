import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:run_box/my_game.dart';

void main() {
  final game = MyGame();
  runApp(GameWidget(game: game));
}
