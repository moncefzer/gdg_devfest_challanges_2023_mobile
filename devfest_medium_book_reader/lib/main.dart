import 'package:book_reader_mine/view/my_screen.dart';
import 'package:flutter/material.dart';
import 'package:book_reader_mine/view/my_screen.dart' as my_screen;
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        my_screen.DetailsScreen.routeName: (_) =>
            const my_screen.DetailsScreen(),
      },
      title: 'MY APP',
      home: const MyScreen(),
    );
  }
}
