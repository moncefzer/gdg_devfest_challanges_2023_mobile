import 'package:devfest_store/core/animations/show_animation.dart';
import 'package:devfest_store/core/animations/show_up_animation.dart';
import 'package:devfest_store/features/home/widgets/price_widget.dart';

import '../../core/utils/common_libs.dart';
import '../../core/widgets/background_appbar.dart';
import 'widgets/settings_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ShowAnimation(child: _buildAppBar(context)),
          SizedBox(height: 50.h),
          ShowUpAnimation(
            yOffset: 10,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  _buildUserCard(context),
                  SizedBox(height: 10.h),
                  const SettingItem(
                      title: 'Pofile Info',
                      icon: Assets.iconsUserIdVerification),
                  SizedBox(height: 10.h),
                  const SettingItem(
                    title: 'Password Settings',
                    icon: Assets.iconsSquarePassword,
                  ),
                  SizedBox(height: 10.h),
                  const SettingItem(
                      title: 'Get Help', icon: Assets.iconsHelpSquare),
                  SizedBox(height: 10.h),
                  // todo : use svg to change icon color
                  const SettingItem(
                    title: 'Logout',
                    icon: Assets.iconsLogoutSquare02,
                    color: Colors.red,
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildUserCard(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,

      // padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Ahmed Yacine',
              style: context.titleLarge,
            ),
          ),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: AppColors.blue,
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your Balance',
                            style: context.titleLarge
                                .copyWith(fontWeight: FontWeight.w500)),
                        SizedBox(height: 20.h),
                        PriceWidget(
                          price: 1250,
                          color: Colors.white,
                          size: 25.w,
                          fontSize: 30.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  height: 70,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    Assets.imagesPattern,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  height: 70,
                  width: 140,
                  right: 20,
                  bottom: 0,
                  child: Image.asset(Assets.imagesDevfest),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return BackgroundAppBar(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                "Explore your \nRemarkable profile",
                style: context.bodyLarge.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
