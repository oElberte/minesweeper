import 'package:flutter/material.dart';
import 'package:minesweeper/components/field_widget.dart';
import 'package:minesweeper/models/board.dart';
import 'package:minesweeper/models/field.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final void Function(Field) onOpen;
  final void Function(Field) onChangeMarkup;

  const BoardWidget({
    Key? key,
    required this.board,
    required this.onOpen,
    required this.onChangeMarkup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: board.columns,
      children: board.fields.map((f) {
        return FieldWidget(
          field: f,
          onOpen: onOpen,
          onChangeMarkup: onChangeMarkup,
        );
      }).toList(),
    );
  }
}
