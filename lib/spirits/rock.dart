import 'dart:async';

import 'package:flame/components.dart';
import 'package:run_box/my_game.dart';

class Rock extends SpriteComponent with HasGameReference<MyGame> {
  Rock({super.position})
    : super(size: Vector2(50, 50), anchor: Anchor.topCenter);

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("rock.png");
    super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += dt * 200;
    // if (position.y == game.size.y) {
    //   removeFromParent();
    // }
  }
}
