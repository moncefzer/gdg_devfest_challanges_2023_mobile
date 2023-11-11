import 'game_enums.dart';

class Player {
  final Cell value;
  const Player({required this.value});

  @override
  String toString() {
    return value.name;
  }
}
