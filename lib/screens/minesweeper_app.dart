import 'package:flutter/material.dart';
import 'package:minesweeper/components/board_widget.dart';
import 'package:minesweeper/components/result_widget.dart';
import 'package:minesweeper/models/board.dart';
import 'package:minesweeper/models/field.dart';

class MinesweeperApp extends StatelessWidget {
  const MinesweeperApp({Key? key}) : super(key: key);

  void _restart() {
    print('Restart...');
  }

  void _open(Field field) {
    print('Open...');
  }

  void _changeMarkup(Field field) {
    print('Change markup...');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          win: false,
          onRestart: _restart,
        ),
        body: BoardWidget(
          board: Board(
            rows: 15,
            columns: 15,
            qtyMines: 10,
          ),
          onOpen: _open,
          onChangeMarkup: _changeMarkup,
        ),
      ),
    );
  }
}
