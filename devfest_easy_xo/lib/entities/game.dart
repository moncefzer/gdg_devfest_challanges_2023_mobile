import 'entities.dart';

const Player playerX = Player(value: Cell.X);
const Player playerO = Player(value: Cell.O);
const defaultPlayer = playerX;

class Game {
  //* Game setup ---------------------------------------------------
  late Player player;
  late List<List<Cell>> board;

  Game() {
    board = _emptyList();
    player = defaultPlayer;
  }

  Game.clone(Game other) {
    board = List.generate(N, (i) => List.generate(N, (j) => other.board[i][j]));
    player = other.player;
  }

  List<List<Cell>> _emptyList() =>
      List.generate(N, (_) => List.generate(N, (_) => Cell.empty));

  //* Game utils -----------------------------

  List<Move> getAvailableMoves() {
    List<Move> moves = [];
    for (int i = 0; i < N; i++) {
      for (int j = 0; j < N; j++) {
        if (board[i][j] == Cell.empty) {
          moves.add(Move(i, j));
        }
      }
    }
    return moves;
  }

  void moveWithToggle(Move move) {
    if (board[move.row][move.col] == Cell.empty) {
      board[move.row][move.col] = player.value;
    }
    togglePlayer();
  }

  void resetMove(Move move) {
    if (board[move.row][move.col] != Cell.empty) {
      board[move.row][move.col] = Cell.empty;
    }
  }

  void moveWithoutToggle(Move move) {
    if (board[move.row][move.col] == Cell.empty) {
      board[move.row][move.col] = player.value;
    }
  }

  void togglePlayer() {
    if (player.value == Cell.X) {
      player = playerO;
    } else {
      player = playerX;
    }
  }

  GameStatus checkWin(Move move) {
    var status = GameStatus.uncettled;
    var winCol = true, winRow = true, winDiag = true, winRevDiag = true;
    for (int i = 0; i < 3; i++) {
      //* check row
      if (board[move.row][i] != player.value) {
        winRow = false;
      }
      //* check row
      if (board[i][move.col] != player.value) {
        winCol = false;
      }
      //* check diagonal
      if (board[i][i] != player.value) {
        winDiag = false;
      }
      //* check reverse diagonal
      if (board[2 - i][i] != player.value) {
        winRevDiag = false;
      }
    }
    if (winRevDiag || winCol || winRow || winDiag) {
      status = GameStatus.win;
    } else {
      if (getAvailableMoves().isEmpty) {
        status = GameStatus.draw;
      }
    }

    return status;
  }

  bool isWinner(Player player, Move move) {
    var winCol = true, winRow = true, winDiag = true, winRevDiag = true;
    for (int i = 0; i < N; i++) {
      //* check row
      if (board[move.row][i] != player.value) {
        winRow = false;
      }
      //* check row
      if (board[i][move.col] != player.value) {
        winCol = false;
      }
      //* check diagonal
      if (board[i][i] != player.value) {
        winDiag = false;
      }
      //* check reverse diagonal
      if (board[N - 1 - i][i] != player.value) {
        winRevDiag = false;
      }
    }

    if (winRevDiag || winDiag || winCol || winRow) return true;

    return false;
  }

  bool isFinished() => getAvailableMoves().isEmpty;
}





































//  List<List<int>> _getEmptyCells() {
//     List<List<int>> emptyCells = [];
//     for (int i = 0; i < board.length; i++) {
//       for (int j = 0; j < board[i].length; j++) {
//         if (board[i][j] == Cell.empty) {
//           emptyCells.add([i, j]);
//         }
//       }
//     }
//     return emptyCells;
//   }
