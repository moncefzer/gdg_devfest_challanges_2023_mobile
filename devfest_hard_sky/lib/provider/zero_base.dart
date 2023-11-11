import 'package:flutter/material.dart';
import 'package:hard_sky/utils/utils.dart';

import 'zero_impl.dart';

abstract class ZerefBase<T> {
  void emit(T value) {}
  void addError(Object error, [StackTrace? stackTrace]) {}
  void addStream(Stream<T> stream) {}
  void dispose() {}
}

class ZerefException implements Exception {
  final String message;
  ZerefException(this.message);
}

class NavigationZeref extends Zeref<void> {
  NavigationZeref() : super(null);

  void navigateTo(BuildContext context, String routeName) {
    context.pushNamed(routeName);
  }
}
