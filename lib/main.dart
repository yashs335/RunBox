import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:run_box/my_world.dart';

void main() {
  runApp(GameWidget(game: FlameGame(world: MyWorld())));
}
