enum Cell { X, O, empty }

extension CellExt on Cell {
  Cell changePlayer() {
    return this == Cell.O ? Cell.X : Cell.O;
  }
}

enum GameStatus { win, draw, uncettled }

const N = 3;
