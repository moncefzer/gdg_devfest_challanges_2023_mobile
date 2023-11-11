import '../../../core/utils/common_libs.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    this.price = 150,
    this.color = AppColors.blue,
    this.size = 15,
    this.fontSize = 16,
  });

  final double price;
  final Color color;
  final double size;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$price',
          style: context.titleLarge.copyWith(color: color, fontSize: fontSize),
        ),
        const SizedBox(width: 3),
        Image.asset(
          Assets.imagesdevestCoin,
          height: size,
          width: size,
        )
      ],
    );
  }
}
