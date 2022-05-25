import 'dart:math';

import 'field.dart';

class Board {
  final int rows;
  final int columns;
  final int qtyMines;

  final List<Field> _fields = [];

  Board({
    required this.rows,
    required this.columns,
    required this.qtyMines,
  }) {
    _createFields();
    _relateNeighbors();
    _raffleMines();
  }

  void restart() {
    for (var f in _fields) {
      f.restart();
    }
    _raffleMines();
  }

  void revealMines() {
    for (var f in _fields) {
      f.revealMine();
    }
  }

  void _createFields() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < columns; c++) {
        _fields.add(Field(row: r, column: c));
      }
    }
  }

  void _relateNeighbors() {
    for (var field in _fields) {
      for (var neighbor in _fields) {
        field.addNeighbor(neighbor);
      }
    }
  }

  void _raffleMines() {
    int raffleds = 0;

    if (qtyMines > rows * columns) {
      return;
    }

    while (raffleds < qtyMines) {
      int i = Random().nextInt(_fields.length);

      if (!_fields[i].mined) {
        raffleds++;
        _fields[i].mine();
      }
    }
  }

  List<Field> get fields {
    return _fields;
  }

  bool get resolved {
    return _fields.every((f) => f.resolved);
  }
}
