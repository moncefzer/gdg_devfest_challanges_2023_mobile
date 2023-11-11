import 'package:devfest_app/core/app_cubit/app_cubit.dart';
import 'package:devfest_app/core/config/app_router.dart';
import 'package:devfest_app/core/constants/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/app_themes.dart';
import 'core/utils/common_libs.dart';

class DevFestApp extends StatelessWidget {
  const DevFestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => AppCubit(),
          child: MaterialApp(
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.genereteRoute,
            initialRoute: Routes.splash,
          ),
        );
      },
    );
  }
}
