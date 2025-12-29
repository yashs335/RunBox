import 'package:flame/components.dart';
import 'package:run_box/my_game.dart';
import 'package:run_box/spirits/bullet.dart';

class Player extends SpriteAnimationComponent with HasGameReference<MyGame> {
  Player({super.position})
    : super(size: Vector2(100, 150), anchor: Anchor.center);
  late TimerComponent _shootTimer;

  @override
  Future<void> onLoad() async {
    animation = await SpriteAnimation.load(
      'player.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: .2,
        textureSize: Vector2(32, 48),
        loop: true,
      ),
    );
    position = game.size / 2;

    _shootTimer = TimerComponent(
      period: 0.2,
      autoStart: false,
      repeat: true,
      onTick: () {
        final bullet = Bullet();
        bullet.position = position;
        game.add(bullet);
      },
    );
    add(_shootTimer);
  }

  void move(Vector2 delta) {
    position.add(delta);
    position.x = position.x.clamp(width / 2, game.width - width / 2);
    position.y = position.y.clamp(height / 2, game.height - height / 2);
  }

  void goLeft() {
    move(Vector2(position.x--, 0));
  }

  void goRight() {
    move(Vector2(position.x++, 0));
  }

  void startShooting() {
    _shootTimer.timer.start();
  }

  void endShooting() {
    _shootTimer.timer.stop();
  }
}
