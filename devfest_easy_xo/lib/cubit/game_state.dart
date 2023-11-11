part of 'game_cubit.dart';

class GameState {
  final Player player;
  final GameStatus status;
  final bool isGameOver;

  GameState({
    this.player = defaultPlayer,
    this.status = GameStatus.uncettled,
    this.isGameOver = false,
  });

  GameState copyWith({
    Player? player,
    GameStatus? status,
    bool? isGameOver,
  }) {
    return GameState(
      player: player ?? this.player,
      status: status ?? this.status,
      isGameOver: isGameOver ?? this.isGameOver,
    );
  }

  @override
  String toString() =>
      'GameState(player: $player, status: $status, isGameOver: $isGameOver)';
}
