import 'package:flame/components.dart';
import 'package:run_box/my_game.dart';
import 'package:run_box/spirits/bullet.dart';

enum PlayerDirection { left, right, none }

class Player extends SpriteAnimationComponent with HasGameReference<MyGame> {
  Player({super.position})
      : super(size: Vector2(100, 150), anchor: Anchor.center);
  late TimerComponent _shootTimer;
  PlayerDirection _direction = PlayerDirection.none;
  final double _speed = 300;

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

  @override
  void update(double dt) {
    super.update(dt);
    if (_direction == PlayerDirection.left) {
      position.x -= _speed * dt;
    } else if (_direction == PlayerDirection.right) {
      position.x += _speed * dt;
    }
    position.x = position.x.clamp(width / 2, game.width - width / 2);
  }

  void moveLeft() {
    _direction = PlayerDirection.left;
  }

  void moveRight() {
    _direction = PlayerDirection.right;
  }

  void stop() {
    _direction = PlayerDirection.none;
  }

  void startShooting() {
    _shootTimer.timer.start();
  }

  void endShooting() {
    _shootTimer.timer.stop();
  }
}
