import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

class Button extends SpriteComponent with TapCallbacks {
  final String imagePath;
  final VoidCallback? onTapDownCallback;
  Button({super.position, required this.imagePath, this.onTapDownCallback});

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(imagePath);
    super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    onTapDownCallback?.call();
  }
}
