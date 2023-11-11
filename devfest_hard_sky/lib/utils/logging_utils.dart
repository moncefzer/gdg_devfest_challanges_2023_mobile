import 'package:flutter/material.dart';
import 'package:hard_sky/provider/provider.dart';

import '../provider/zero_base.dart';

class LoggingShortcutManager extends ShortcutManager {
  @override
  KeyEventResult handleKeypress(BuildContext context, RawKeyEvent event) {
    final KeyEventResult result = super.handleKeypress(context, event);
    // if (result == KeyEventResult.handled) {
    //   throw const SocketException(
    //     "SocketException: OS Error: Connection refused, errno = 111, address = localhost, port = 60703",
    //   );
    // }
    return result;
    // throw const SocketException(
    //   "SocketException: OS Error: Connection refused, errno = 111, address = localhost, port = 60703",
    // );
  }
}

class LoggingActionDispatcher extends ActionDispatcher {
  @override
  Object? invokeAction(
    covariant Action<Intent> action,
    covariant Intent intent, [
    BuildContext? context,
  ]) {
    print('Action invoked: $action($intent) from $context');
    super.invokeAction(action, intent, context);
    return null;
    // throw UnimplementedError();
  }
}

class ZerefIntent extends Intent {
  const ZerefIntent();
}

class ZerefAction extends Action<ZerefIntent> {
  final BuildContext context;
  ZerefAction(this.context);

  @override
  Object? invoke(covariant ZerefIntent intent) {
    final NavigationZeref navigate = context.get<NavigationZeref>();
    navigate.navigateTo(context, "/sky");

    return null;
  }
}

extension MyAction on BuildContext {
  void invokeAction<T extends Intent>(T intent) {
    Actions.invoke(this, intent);
  }
}
