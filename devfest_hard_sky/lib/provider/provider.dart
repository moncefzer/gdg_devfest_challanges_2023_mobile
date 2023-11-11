import 'package:flutter/material.dart';

import 'zero_base.dart';
import 'zero_impl.dart';

class ZerefProvider<T extends ZerefBase> extends InheritedWidget {
  final T value;

  const ZerefProvider({Key? key, required this.value, required super.child});

  static T of<T extends ZerefBase>(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ZerefProvider<T>>();

    if (provider == null) {
      throw Exception("${ZerefProvider<T>} not found in the widget tree.");
    }
    return provider.value;
  }

  @override
  bool updateShouldNotify(ZerefProvider<T> oldWidget) {
    return value != oldWidget.value;
  }
}

// class InheritedZerefProvider<T extends ZerefBase> extends InheritedWidget {
//   final T value;

//   const InheritedZerefProvider({
//     Key? key,
//     required this.value,
//     required Widget child,
//   }) : super(key: key, child: child);

//   @override
//   bool updateShouldNotify(InheritedZerefProvider<T> oldWidget) {
//     return value != oldWidget.value;
//   }
// }

// class ZerefProvider<T extends ZerefBase> extends StatefulWidget {
//   final T value;
//   final Widget? child;

//   const ZerefProvider({Key? key, required this.value, this.child})
//       : super(key: key);
//   @override
//   State<StatefulWidget> createState() => _ZerefProviderState();

//   static T of<T extends ZerefBase>(BuildContext context) {
//     // ZerefProvider<T>? provider =
//     // context.findAncestorWidgetOfExactType<InheritedZerefProvider<T>>();
//     final provider =
//         context.dependOnInheritedWidgetOfExactType<InheritedZerefProvider<T>>();
//     if (provider == null) {
//       throw Exception(
//           "${InheritedZerefProvider<T>} not found in the widget tree.");
//     }
//     return provider.value;
//   }
// }

// class _ZerefProviderState<T extends ZerefBase> extends State<ZerefProvider<T>> {
//   @override
//   Widget build(BuildContext context) {
//     print('Type ${widget.value.runtimeType}');
//     return InheritedZerefProvider(
//       value: widget.value,
//       child: widget.child ?? const SizedBox.shrink(),
//     );
//   }

//   @override
//   void dispose() {
//     widget.value.dispose();
//     // widget.createState();
//     // setState(() {});

//     super.dispose();
//   }
// }

// class InheritedZerefProvider<T extends ZerefBase> extends InheritedWidget {
//   final T value;

//   const InheritedZerefProvider({
//     Key? key,
//     required this.value,
//     required Widget child,
//   }) : super(key: key, child: child);

//   @override
//   bool updateShouldNotify(InheritedZerefProvider<T> oldWidget) {
//     return value != oldWidget.value;
//   }
// }

class ZerefBuilder<T extends Zeref> extends StatelessWidget {
  final Widget Function(BuildContext context, T value) builder;

  const ZerefBuilder({Key? key, required this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    T value = context.get<T>();

    // return builder(context, value);

    // Stream stream = value as Stream;
    return StreamBuilder(
      stream: value.valueStream,
      builder: (context, snapshot) {
        return builder(context, value);
      },
    );
  }
}

class ZerefListener<T extends Zeref> extends StatelessWidget {
  final void Function(BuildContext context, T value) listener;
  final Widget child;
  const ZerefListener({Key? key, required this.listener, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    T value = ZerefProvider.of<T>(context);
    listener(context, value);
    return child;
  }
}

extension ReadContext on BuildContext {
  T get<T extends ZerefBase>() {
    return ZerefProvider.of<T>(this);
  }
}
