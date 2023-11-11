import '../../../core/utils/common_libs.dart';

class CheckPointRow extends StatelessWidget {
  const CheckPointRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'DevFest Blue Hoodie',
          style: context.bodySmall.copyWith(
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Qt: 2',
          style: context.bodyMedium.copyWith(
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Price: 160',
          style: context.bodyMedium.copyWith(
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
