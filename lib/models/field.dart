import 'explosion_exception.dart';

class Field {
  final int row;
  final int column;
  final List<Field> neighbors = [];

  bool _opened = false;
  bool _marked = false;
  bool _mined = false;
  bool _exploded = false;

  Field({
    required this.row,
    required this.column,
  });

  // Checks and validate to add a neighbor next to the mine
  void addNeighbor(Field neighbor) {
    final deltaRow = (row - neighbor.row).abs();
    final deltaColumn = (column - neighbor.column).abs();

    if (deltaRow == 0 && deltaColumn == 0) {
      return;
    }

    if (deltaRow <= 1 && deltaColumn <= 1) {
      neighbors.add(neighbor);
    }
  }

  // Checks and validate when the user open a field
  void open() {
    if (_opened) {
      return;
    }

    _opened = true;

    if (_mined) {
      _exploded = true;
      throw ExplosionException();
    }

    if (safeNeighborhood) {
      for (var n in neighbors) {
        n.open();
      }
    }
  }

  void revealMine() {
    if (_mined) {
      _opened = true;
    }
  }

  void mine() {
    _mined = true;
  }

  void changeMarkup() {
    _marked = !_marked;
  }

  void restart() {
    _opened = false;
    _marked = false;
    _mined = false;
    _exploded = false;
  }

  bool get mined {
    return _mined;
  }

  bool get exploded {
    return _exploded;
  }

  bool get opened {
    return _opened;
  }

  bool get marked {
    return _marked;
  }

  bool get resolved {
    bool minedAndMarked = mined && marked;
    bool safeAndOpened = !mined && opened;
    return minedAndMarked || safeAndOpened;
  }

  // If the field doesn't have mines
  bool get safeNeighborhood {
    return neighbors.every((n) => !n.mined);
  }

  // Quantity of mines in the neighborhood
  int get qtyMinesInNeighborhood {
    return neighbors.where((n) => n.mined).length;
  }
}
