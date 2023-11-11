import '../../../core/utils/common_libs.dart';
import '../../../core/widgets/default_button.dart';

class CollectionWidget extends StatelessWidget {
  const CollectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: 140,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        children: [
          //todo : add all photos in stack
          Image.asset(Assets.imagesHoddie3),
          SizedBox(width: 10.w),
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
                Text(
                  'Hoodie+Sticker+Bracelets',
                  style: context.labelLarge.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 120.w,
                    height: 25.h,
                    child: DefaultButton(text: 'Show Details', press: () {}),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
