import 'package:flutter/material.dart';
import 'package:minesweeper/components/result_widget.dart';

class MinesweeperApp extends StatelessWidget {
  const MinesweeperApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          win: false,
          onRestart: null,
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: const Text('Board'),
        ),
      ),
    );
  }
}
