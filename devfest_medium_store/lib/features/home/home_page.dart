import 'package:devfest_store/core/animations/show_animation.dart';
import 'package:devfest_store/core/animations/show_up_animation.dart';
import 'package:devfest_store/core/config/app_sizes.dart';
import 'package:devfest_store/core/utils/common_libs.dart';

import '../../core/widgets/background_appbar.dart';
import 'data.dart';
import 'widgets/category_widget.dart';
import 'widgets/collection_widget.dart';
import 'widgets/offre_widget.dart';
import 'widgets/product_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ShowAnimation(child: _buildAppBar(context)),
              SizedBox(height: 70.h),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ShowUpAnimation(
                  yOffset: 30,
                  duration: AppSizes.duration230,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCategories(),
                      SizedBox(height: 20.h),
                      const SectionTitle(title: 'Special Offers'),
                      SizedBox(height: 40.h),
                      _buildOffersSection(),
                      SizedBox(height: 20.h),
                      const SectionTitle(title: 'Newest Items'),
                      SizedBox(height: 40.h),
                      _buildNewItemsSection(),
                      SizedBox(height: 20.h),
                      const SectionTitle(title: 'Our Collections'),
                      SizedBox(height: 15.h),
                      _buildOurCollectionsSection(),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildNewItemsSection() {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: Product.products.length,
        itemBuilder: (context, index) {
          final product = Product.products[index];

          return ProductWidget(product: product);
        },
      ),
    );
  }

  Widget _buildOurCollectionsSection() {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      clipBehavior: Clip.none,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return CollectionWidget();
      },
    );
  }

  SizedBox _buildOffersSection() {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const OffreWidget();
        },
      ),
    );
  }

  Row _buildCategories() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryWidget(
          title: 'T-Shirt',
          image: Assets.imagesIsolatedBlackTShirtFront1,
        ),
        CategoryWidget(
          title: 'Hoodie',
          image: Assets.imagesHoddie3,
        ),
        CategoryWidget(
          title: 'Stickers',
          image: Assets.imagesDevfestCircle,
        ),
      ],
    );
  }

  BackgroundAppBar _buildAppBar(BuildContext context) {
    return BackgroundAppBar(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                "Hello Ahmed \nStart explore our products",
                style: context.bodyLarge.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Image.asset(Assets.iconsVector)
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.titleLarge.copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
