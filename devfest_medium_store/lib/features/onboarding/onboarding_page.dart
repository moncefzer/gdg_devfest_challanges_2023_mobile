import 'package:devfest_store/core/animations/show_up_animation.dart';
import 'package:devfest_store/core/config/app_sizes.dart';
import 'package:devfest_store/core/utils/common_libs.dart';
import 'dart:math' show pi;

import '../../core/animations/page_translations.dart';
import '../layout/layout_page.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowUpAnimation(
        duration: AppSizes.duration400,
        yOffset: 50,
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Expanded(
              flex: 3,
              child: _buildImages(),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      Assets.imagesPattern,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(40.h),
                    padding: EdgeInsets.all(20.h),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                          const TextSpan(
                            children: [
                              TextSpan(text: 'Get '),
                              TextSpan(
                                text: 'DevFest ',
                                style: TextStyle(color: AppColors.blue),
                              ),
                              TextSpan(
                                text:
                                    "items from our Amazing Store ,Don’t miss the New offers ",
                              ),
                            ],
                          ),
                          style: context.bodyLarge
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 15.h),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              FadePageTransition(
                                page: const LayoutPage(),
                              ),
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            minimumSize: const Size(170, 50),
                          ),
                          child: Text(
                            'Get New',
                            style: context.bodyMedium
                                .copyWith(color: AppColors.black),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack _buildImages() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(Assets.imagesDevfestCircle),
        Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.identity()
            ..translate(
              60.0,
            )
            ..rotateZ(pi * 0.04),
          child: Image.asset(
            Assets.imagesIsolatedBlackTShirtFront1,
            // height: 300,
            // width: 300,
          ),
        ),
        Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.identity()
            ..translate(
              -60.0,
            )
            ..rotateZ(-pi * 0.04),
          child: Image.asset(
            Assets.imagesHoddie3,
            // height: 300,
            // width: 300,
          ),
        ),
      ],
    );
  }
}
