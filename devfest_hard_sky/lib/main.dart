import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hard_sky/provider/provider.dart';
import 'package:hard_sky/slide_animation.dart';

import 'provider/zero_base.dart';
import 'provider/zero_impl.dart';
import 'utils/logging_utils.dart';
import 'utils/utils.dart';
import 'widgets/sky.dart';

void main() => runApp(const MyApp());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Actions(
      dispatcher: LoggingActionDispatcher(),
      actions: {ZerefIntent: ZerefAction(context)},
      child: Builder(builder: (context) {
        return Focus(
          autofocus: true,
          child: GestureDetector(
            onVerticalDragDown: (details) {
              if (getCurrentPlatform() == PlatformType.mobile) {
                // navigate to the sky using zeref navigation
                // NavigationZeref().navigateTo(context, '/sky');
                ZerefProvider.of<NavigationZeref>(context)
                    .navigateTo(context, '/sky');
              }
            },
            child: Scaffold(
                body: Center(
              child: getCurrentPlatform() == PlatformType.mobile
                  ? const Text('Swipe down to navigate to sky')
                  : const Text('Click the right shortcut to navigate to sky'),
            )),
          ),
        );
      }),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ZerefProvider(
      // navigation Provider
      value: NavigationZeref(),
      child: ZerefProvider(
        value: DirectionZeref(),
        child: MaterialApp(
          home: Shortcuts(
            shortcuts: {
              LogicalKeySet(
                LogicalKeyboardKey.control,
                LogicalKeyboardKey.keyG,
                LogicalKeyboardKey.keyD,
              ): const ZerefIntent(),
            },
            child: const Home(),
          ),
          // routes: {
          //   '/sky': (_) => const Sky(),
          // },
          onGenerateRoute: (settings) {
            if (settings.name == '/sky') {
              return slidePageBuilder(const Sky());
            }
            return null; // Handle other routes if needed
          },
        ),
      ),
    );
  }
}
