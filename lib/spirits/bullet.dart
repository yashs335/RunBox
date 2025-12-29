import 'package:flame/components.dart';
import 'package:run_box/my_game.dart';

class Bullet extends SpriteAnimationComponent with HasGameReference<MyGame> {
  Bullet({super.position})
    : super(size: Vector2(25, 50), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    animation = await SpriteAnimation.load(
      'bullet.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.1,
        textureSize: Vector2(8, 16),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += dt * -500;
    if (position.y < 0) {
      removeFromParent();
    }
  }
}
