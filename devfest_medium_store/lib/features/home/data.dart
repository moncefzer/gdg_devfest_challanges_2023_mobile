import '../../core/constants/assets.dart';

class Product {
  final String name;
  final String image;
  final double price;

  Product({
    required this.name,
    required this.image,
    required this.price,
  });

  static final products = [
    Product(
      name: 'Black-Yellow Devfest Hoodie',
      image: Assets.imagesHoddieBleuYellow,
      price: 150,
    ),
    Product(
      name: 'devfest specail T-shirt',
      image: Assets.imagesHoddieBleuYellow,
      price: 150,
    ),
    Product(
      name: 'devfest specail T-shirt',
      image: Assets.imagesBumperWeightPlateSideView112,
      price: 150,
    ),
  ];
}
