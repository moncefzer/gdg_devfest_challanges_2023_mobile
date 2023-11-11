import '../../../core/utils/common_libs.dart';
import '../../../core/widgets/default_button.dart';
import 'price_widget.dart';

class OffreWidget extends StatelessWidget {
  const OffreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 0.7.sw,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Image.asset(Assets.imagesHoddieBleuYellow),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        '-50%',
                        style: context.titleMedium.copyWith(
                          fontSize: 19.sp,
                          color: AppColors.yellow,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('devfest special t-shirt'),
                    SizedBox(height: 15.h),
                    const PriceWidget(),
                    SizedBox(height: 15.h),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: 100.w,
                        height: 30.h,
                        child: DefaultButton(text: 'Buy Now', press: () {}),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: -40,
          top: -40,
          height: 150,
          width: 140,
          child: Image.asset(Assets.imagesHoddieBleuYellow),
        ),
      ],
    );
  }
}
