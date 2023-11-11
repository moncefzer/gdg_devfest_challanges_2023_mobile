import '../core/constants/assets.dart';

class Field {
  final String name;
  final String image;

  Field({required this.name, required this.image});
}

final fields = [
  Field(name: 'Mobile', image: Assets.iconsMobileProgramming01),
  Field(name: 'Web', image: Assets.iconsWebDesign01),
  Field(name: 'AI', image: Assets.iconsDeveloper),
  Field(name: 'Game', image: Assets.iconsGameboy),
  Field(name: 'Security', image: Assets.iconsWebSecurity),
];
