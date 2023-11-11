import '../../../core/utils/common_libs.dart';
import '../../../core/widgets/default_button.dart';
import '../../home/widgets/price_widget.dart';

class ProductCheckoutWidget extends StatelessWidget {
  const ProductCheckoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 15,
      ),
      height: 130.h,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        children: [
          Image.asset(Assets.imagesHoddie3),
          SizedBox(width: 30.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Devfest Blue Collection',
                  style: context.titleMedium,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      'Quantite:',
                      style: context.labelLarge.copyWith(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const PriceWidget(price: 160),
                    SizedBox(
                      width: 90.w,
                      height: 27.h,
                      child: DefaultButton(
                        text: 'Buy',
                        press: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
