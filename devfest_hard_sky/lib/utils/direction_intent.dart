import 'package:flutter/material.dart';

import '../provider/provider.dart';
import '../provider/zero_impl.dart';
import 'utils.dart';

abstract class DirectionIntent extends Intent {
  const DirectionIntent();
}

class DirectionIntentLeft extends DirectionIntent {
  const DirectionIntentLeft();
}

class DirectionIntentRight extends DirectionIntent {
  const DirectionIntentRight();
}

class DirectionIntentUp extends DirectionIntent {
  const DirectionIntentUp();
}

class DirectionIntentDown extends DirectionIntent {
  const DirectionIntentDown();
}

class DirectionAction extends Action<DirectionIntent> {
  final BuildContext context;
  final Direction direction;
  DirectionAction(this.context, this.direction);

  @override
  Object? invoke(covariant DirectionIntent intent) {
    final directionZeref = ZerefProvider.of<DirectionZeref>(context);

    // final DirectionZeref? directionZeref = null;
    directionZeref.changeDirection(direction);
    return null;
  }
}
