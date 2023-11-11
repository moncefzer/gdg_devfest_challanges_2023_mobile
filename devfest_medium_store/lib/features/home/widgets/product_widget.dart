import '../../../core/utils/common_libs.dart';
import '../../../core/widgets/default_button.dart';
import '../data.dart';
import 'price_widget.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 0.55.sw,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 100.h,
                      maxWidth: 100.w,
                    ),
                    child: Text(
                      product.name,
                      style: context.bodyLarge,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PriceWidget(),
                  SizedBox(
                    width: 100.w,
                    height: 30.h,
                    child: DefaultButton(
                      text: 'Add to Cart',
                      press: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: -40,
          top: -40,
          height: 150,
          width: 140,
          child: Image.asset(product.image),
        ),
      ],
    );
  }
}
