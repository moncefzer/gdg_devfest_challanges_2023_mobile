import 'package:devfest_app/core/app_cubit/app_cubit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/utils/common_libs.dart';
import '../widgets/nav_drawer.dart';

class LayoutPage extends StatelessWidget {
  LayoutPage({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const NavDrawer(),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.bgColor,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        leading: GestureDetector(
          onTap: () {
            _key.currentState?.openDrawer();
          },
          child: Image.asset(Assets.iconsMenu02),
        ),
        centerTitle: true,
        leadingWidth: 70,
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Image.asset(
            Assets.imagesBleuLogo,
            height: 30,
            color: AppColors.blue,
          ),
        ),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is AppChangeBottNavIndexState) {
            return AppCubit.get(context).screens[state.index];
          }

          return AppCubit.get(context).screens[0];
        },
      ),
    );
  }
}
