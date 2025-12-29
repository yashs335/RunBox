import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:run_box/spirits/player.dart';
import 'package:run_box/spirits/rock.dart';

class MyGame extends FlameGame with PanDetector {
  late Player player;
  MyGame() : super();

  double get width => size.x;
  double get height => size.y;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    final parallax = await loadParallaxComponent(
      [ParallaxImageData('star.png'), ParallaxImageData('star.png')],
      baseVelocity: Vector2(0, -5),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 5),
    );

    add(parallax);
    player = Player();

    add(player);
    final Rock rock = Rock();

    add(
      SpawnComponent(
        period: 5,
        area: Rectangle.fromLTWH(0, 0, size.x, 0),
        autoStart: true,
        multiFactory: (amount) {
          return List.generate(3, (index) => rock);
        },
      ),
    );

    add(
      ButtonComponent(
        position: Vector2(0, 0),
        onPressed: () {
          player.goLeft();
        },
      ),
    );

    // world.add(player);

    debugMode = true;
    return super.onLoad();
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.global);
    super.onPanUpdate(info);
  }

  @override
  void onPanStart(DragStartInfo info) {
    super.onPanStart(info);
    player.startShooting();
  }

  @override
  void onPanEnd(DragEndInfo info) {
    super.onPanEnd(info);
    player.endShooting();
  }
}
