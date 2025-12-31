import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:run_box/my_game.dart';

class Button extends SpriteComponent
    with TapCallbacks, HasGameReference<MyGame> {
  final String imagePath;
  final VoidCallback? onTapDownCallback;
  final VoidCallback? onTapUpCallback;
  final VoidCallback? onTapCancelCallback;

  Button({
    super.position,
    required this.imagePath,
    this.onTapDownCallback,
    this.onTapUpCallback,
    this.onTapCancelCallback,
  });

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(imagePath);
    size = Vector2(100, 100);
    super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    onTapDownCallback?.call();
  }

  @override
  void onTapUp(TapUpEvent event) {
    onTapUpCallback?.call();
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    onTapCancelCallback?.call();
  }
}
