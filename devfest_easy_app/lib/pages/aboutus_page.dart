import 'package:devfest_app/core/utils/common_libs.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              Assets.imagesGdgLogo,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'GDG Algiers is a local community situated at the Higher National School of Computer Science in Algiers (ESI ex INI), Algiers, Algeria. It is part of the big global communi -ty of developers "Google Develop-ers Group" an inclusive  environment where everyone and anyone interested in tech is welcome to join. Our community gathers motivated young students with similar interests in Google technologies and devoted developers.',
            style: context.headlineSmall.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 22.sp,
              height: 23 / 18,
            ),
          ),
        ],
      ),
    );
  }
}
