import '../core/utils/common_libs.dart';

class Event {
  final String name;
  final String description;
  final String image;

  const Event(
      {required this.name, required this.description, required this.image});

  static const events = [
    Event(
      name: 'Devfest22',
      description:
          'DevFest "Developers" Festival is an annual, international festival organized by Google Developer Groups (GDG) from around the world.',
      image: Assets.imagesBleuCircle,
    ),
    Event(
      name: 'Devfest21',
      description:
          'DevFest "Developers" Festival is an annual, international festival organized by Google Developer Groups (GDG) from around the world.',
      image: Assets.imagesYellowCircle,
    ),
    Event(
      name: 'Devfest20',
      description:
          'DevFest "Developers" Festival is an annual, international festival organized by Google Developer Groups (GDG) from around the world.',
      image: Assets.imagesBleuCircle,
    ),
    Event(
      name: 'Devfest19',
      description:
          'DevFest "Developers" Festival is an annual, international festival organized by Google Developer Groups (GDG) from around the world.',
      image: Assets.imagesYellowCircle,
    )
  ];
}
