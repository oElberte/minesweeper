import 'package:flutter/material.dart';
import 'package:minesweeper/components/board_widget.dart';
import 'package:minesweeper/components/result_widget.dart';
import 'package:minesweeper/models/board.dart';
import 'package:minesweeper/models/explosion_exception.dart';
import 'package:minesweeper/models/field.dart';

class MinesweeperApp extends StatefulWidget {
  const MinesweeperApp({Key? key}) : super(key: key);

  @override
  State<MinesweeperApp> createState() => _MinesweeperAppState();
}

class _MinesweeperAppState extends State<MinesweeperApp> {
  bool? _win;
  Board? _board;

  void _restart() {
    setState(() {
      _win = null;
      _board!.restart();
    });
  }

  void _open(Field field) {
    if (_win != null) return;

    setState(() {
      try {
        field.open();
        if (_board!.resolved) {
          _win = true;
        }
      } on ExplosionException {
        _win = false;
        _board!.revealMines();
      }
    });
  }

  void _changeMarkup(Field field) {
    if (_win != null) return;

    setState(() {
      field.changeMarkup();
      if (_board!.resolved) {
        _win = true;
      }
    });
  }

  Board _getBoardSize(double width, double height) {
    if (_board == null) {
      int qtyColumns = 15;
      double fieldSize = width / qtyColumns;
      int qtyRows = (height / fieldSize).floor();

      _board = Board(
        rows: qtyRows,
        columns: qtyColumns,
        qtyMines: 50,
      );
    }
    return _board!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          win: _win,
          onRestart: _restart,
        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return BoardWidget(
                board: _getBoardSize(
                  constraints.maxWidth,
                  constraints.maxHeight,
                ),
                onOpen: _open,
                onChangeMarkup: _changeMarkup,
              );
            },
          ),
        ),
      ),
    );
  }
}
