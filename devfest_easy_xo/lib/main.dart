import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/bloc_observer.dart';
import 'cubit/game_cubit.dart';
import 'game_page.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Tic Tac Toe',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          home: BlocProvider(
            create: (context) => GameCubit(),
            child: const GamePage(),
          ),
        );
      },
    );
  }
}
