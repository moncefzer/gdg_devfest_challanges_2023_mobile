import 'package:devfest_app/core/utils/common_libs.dart';

import '../core/app_cubit/app_cubit.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.red,
      width: 0.6.sw,
      child: Column(
        children: [
          Container(
            color: Colors.black,
            height: 120.h,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    Assets.imagesPattern,
                    height: 105.h,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 10,
                  child: Image.asset(
                    Assets.imagesWhiteLogo,
                    height: 40,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 40.h),
          GestureDetector(
            onTap: () {
              AppCubit.get(context).changeNav(0);
              Navigator.pop(context);
            },
            child: Text('Home', style: context.titleMedium),
          ),
          SizedBox(height: 30.h),
          GestureDetector(
            onTap: () {
              AppCubit.get(context).changeNav(1);
              Navigator.pop(context);
            },
            child: Text('About Us', style: context.titleMedium),
          ),
        ],
      ),
    );
  }
}
