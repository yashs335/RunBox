import 'package:flame/components.dart';
import 'package:run_box/player.dart';

class MyWorld extends World {
  @override
  Future<void> onLoad() async {
    add(Player(position: Vector2(0, 0)));
  }
}
