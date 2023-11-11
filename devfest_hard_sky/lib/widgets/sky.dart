import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

import '../provider/zero_impl.dart';
import '../provider/provider.dart';
import '../utils/logging_utils.dart';
import 'shooting_start.dart';
import 'space_baground.dart';
import '../utils/utils.dart';

class Sky extends StatefulWidget {
  const Sky({Key? key}) : super(key: key);

  @override
  State<Sky> createState() => _SkyState();
}

class _SkyState extends State<Sky> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late List<Animation<double>> animations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 6,
        ));
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 8,
      ),
    );
    animations = List.generate(
      2,
      (index) => Tween<double>(begin: 0.0, end: 1).animate(
        CurvedAnimation(
          parent: index == 0 ? _controller : _controller2,
          curve: const Interval(
            0,
            1,
            curve: Curves.linear,
          ),
        ),
      ),
    );
    init();
  }

  void init() {
    _controller.reset();
    _controller2.reset();
    _controller.repeat();
    _controller2.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  List<int> dy = List.generate(300, (index) => math.Random().nextInt(5000));

  // List<int> dy = List.generate(300, (index) => math.Random().nextInt(5000));

  @override
  Widget build(BuildContext context) {
    // List<int> dx1 = List.generate(300, (index) => math.Random().nextInt(500));
    // List<int> dx2 = List.generate(300, (index) => math.Random().nextInt(600));

    // List<int> dx1 = List.generate(300, (index) => math.Random().nextInt(1000));
    // List<int> dx2 = List.generate(300, (index) => math.Random().nextInt(1100));

    return Shortcuts(
      shortcuts: {
        LogicalKeySet(
          LogicalKeyboardKey.control,
          LogicalKeyboardKey.keyG,
          LogicalKeyboardKey.keyD,
        ): const ZerefIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          ZerefIntent: ZerefAction(context),
        },
        child: Focus(
          autofocus: true,
          child: GestureDetector(
            // TODO : implement the gesture detector for mobile devices
            // make sure to use the zeref or action dispatcher
            onVerticalDragUpdate: (details) {
              // check up or down and the emit direction
              if (details.delta.dy > 0) {
                ZerefProvider.of<DirectionZeref>(context).changeDirectionDown();
              } else {
                ZerefProvider.of<DirectionZeref>(context).changeDirectionUp();
              }
            },
            onHorizontalDragUpdate: (details) {
              // check up or down and the emit direction
              if (details.delta.dx > 0) {
                print('right');
                ZerefProvider.of<DirectionZeref>(context)
                    .changeDirectionRight();
              } else {
                ZerefProvider.of<DirectionZeref>(context).changeDirectionLeft();
              }
            },

            child: Scaffold(
              backgroundColor: const Color(0xff00000f),
              body: ZerefBuilder<DirectionZeref>(
                builder: (context, state) {
                  print('*' * 100);
                  print(state.value);
                  print('*' * 100);
                  List<int> dx1 = List.generate(
                      300, (index) => math.Random().nextInt(1000));
                  List<int> dx2 = List.generate(
                      300, (index) => math.Random().nextInt(1800));

                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                        child: const SpaceBackGround(),
                      ),
                      Stack(
                        children: List.generate(
                          300,
                          (index) {
                            return Positioned(
                              left: getDxDirection(
                                state.value,
                                dx1[index].toDouble(),
                              ),
                              top: getDyDirection(
                                state.value,
                                dy[index].toDouble(),
                              ),
                              child: AnimatedBuilder(
                                animation: animations[0],
                                builder: (context, child) {
                                  if (index == 0) {
                                    // final x = getDxDirection(
                                    //   state.value,
                                    //   dx1[index].toDouble(),
                                    // );
                                    // final y = getDyDirection(
                                    //   state.value,
                                    //   dy[index].toDouble(),
                                    // );
                                    // final offset = getOffset(
                                    //   state.value,
                                    //   animations[0],
                                    //   dx1[index].toDouble(),
                                    //   dy[index].toDouble() / 2,
                                    //   scale: 300,
                                    // );
                                    // print('$x $y $offset');
                                  }
                                  return Transform.translate(
                                    offset: getOffset(
                                      state.value,
                                      animations[0],
                                      dx1[index].toDouble(),
                                      dy[index].toDouble() / 3,
                                      scale: 600,
                                    ),
                                    child: child,
                                  );
                                },
                                child: RotatedBox(
                                  quarterTurns: getDeriction(state.value),
                                  child: const ShootingStare(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Stack(
                        children: List.generate(
                          300,
                          (index) {
                            return Positioned(
                              left: getDxDirection(
                                state.value,
                                dx1[index].toDouble(),
                              ),
                              top: getDyDirection(
                                state.value,
                                dy[index].toDouble(),
                              ),
                              child: AnimatedBuilder(
                                animation: animations[1],
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: getOffset(
                                      state.value,
                                      animations[1],
                                      dx2[index].toDouble(),
                                      dy[index].toDouble(),
                                      scale: 300,
                                    ),
                                    child: child,
                                  );
                                },
                                child: RotatedBox(
                                  quarterTurns: getDeriction(state.value),
                                  child: const ShootingStare(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
