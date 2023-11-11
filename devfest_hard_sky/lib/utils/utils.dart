import 'dart:io';

import 'package:flutter/material.dart';

enum Direction {
  left,
  right,
  up,
  down,
}

int getDeriction(Direction direction) {
  switch (direction) {
    case Direction.left:
      return 1;
    case Direction.right:
      return 3;
    case Direction.up:
      return 2;
    case Direction.down:
      return 0;
  }
}

Offset getOffset(
    Direction direction, Animation<double> animation, double dx, double dy,
    {double scale = 1000}) {
  // was 2000
  switch (direction) {
    case Direction.left:
      // return Offset(dx - scale * animation.value, dy);
      return Offset(-scale * animation.value, 0);
    case Direction.right:
      // return Offset(dx + scale * animation.value, dx);
      return Offset(scale * animation.value, 0);
    case Direction.up:
      // return Offset(dx, dy - scale * animation.value);
      return Offset(0, -scale * animation.value);
    case Direction.down:
      // return Offset(dx, dy + scale * animation.value);
      return Offset(0, scale * animation.value);
  }
}

double getDxDirection(Direction direction, double dx) {
  switch (direction) {
    case Direction.left:
      return dx;
    case Direction.right:
      return dx;
    case Direction.up:
      return dx;
    case Direction.down:
      return dx;
  }
}

double getDyDirection(Direction direction, double dy) {
  switch (direction) {
    case Direction.left:
      return dy;
    case Direction.right:
      return dy;
    case Direction.up:
      return dy;
    case Direction.down:
      return dy;
  }
}

enum PlatformType {
  mobile,
  desktop,
}

PlatformType getCurrentPlatform() {
  if (Platform.isAndroid || Platform.isIOS) {
    return PlatformType.mobile;
  } else {
    return PlatformType.desktop;
  }
}

extension Push on BuildContext {
  void pushNamed(String routeName) {
    Navigator.of(this).pushNamed(routeName);
  }
}
