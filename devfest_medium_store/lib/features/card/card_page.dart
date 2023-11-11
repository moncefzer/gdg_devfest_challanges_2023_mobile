import 'package:devfest_store/core/animations/show_animation.dart';
import 'package:devfest_store/core/animations/show_up_animation.dart';
import 'package:devfest_store/core/utils/common_libs.dart';
import 'package:devfest_store/features/home/widgets/price_widget.dart';

import '../../core/widgets/background_appbar.dart';
import '../../core/widgets/default_button.dart';
import 'widgets/check_point_row.dart';
import 'widgets/product_checkout_widget.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ShowAnimation(child: _buildAppBar(context)),
            SizedBox(height: 50.h),
            ShowUpAnimation(
              yOffset: 20,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const ProductCheckoutWidget(),
                    SizedBox(height: 15.h),
                    const ProductCheckoutWidget(),
                    SizedBox(height: 30.h),
                    _buildCheckPoint(context),
                    SizedBox(height: 20.h),
                    _buildBuyButton(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Align _buildBuyButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 0.3.sw,
        height: 35,
        child: DefaultButton(
          text: 'Buy All',
          press: () {},
        ),
      ),
    );
  }

  Container _buildCheckPoint(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Checkpoint',
            style: context.titleLarge.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15.h),
          const CheckPointRow(),
          SizedBox(height: 15.h),
          const CheckPointRow(),
          SizedBox(height: 30.h),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ',
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const PriceWidget(price: 320),
            ],
          ),
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
                "Fill your cart \nWith fantastic products!",
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
