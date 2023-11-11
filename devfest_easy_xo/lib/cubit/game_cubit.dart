import 'package:flutter_bloc/flutter_bloc.dart';

import '../entities/entities.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState());

  static GameCubit get(context) => BlocProvider.of(context);
  Game game = Game();

  void makeMove(Move move) async {
    if (state.isGameOver) return;

    await _moveThenCheckWin(move);
  }

  Future<void> _moveThenCheckWin(Move move) async {
    game.moveWithoutToggle(move);
    _checkWin(move);
  }

  void _checkWin(Move move) {
    var gameResult = game.checkWin(move);
    if (gameResult == GameStatus.draw || gameResult == GameStatus.win) {
      final currentPlayer = game.player;
      emit(state.copyWith(
        isGameOver: true,
        status: gameResult,
        player: currentPlayer,
      ));
    } else {
      game.togglePlayer();
      _updateUI();
    }
  }

  void _updateUI() {
    if (state.isGameOver) return;
    final currentPlayer = game.player;
    emit(state.copyWith(player: currentPlayer));
  }

  repeatGame() {
    game = Game();
    emit(GameState());
  }
}
