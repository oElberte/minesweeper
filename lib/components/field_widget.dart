import 'package:flutter/material.dart';
import 'package:minesweeper/models/field.dart';

class FieldWidget extends StatelessWidget {
  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) onChangeMarkup;

  FieldWidget({
    required this.field,
    required this.onOpen,
    required this.onChangeMarkup,
  });

  Widget _getImage() {
    int qtyMines = field.qtyMinesInNeighborhood;

    if (field.opened && field.mined && field.exploded) {
      return Image.asset('assets/images/mine_0.jpeg');
    } else if (field.opened && field.mined) {
      return Image.asset('assets/images/mine_1.jpeg');
    } else if (field.opened) {
      return Image.asset('assets/images/open_$qtyMines.jpeg');
    } else if (field.marked) {
      return Image.asset('assets/images/flag.jpeg');
    } else {
      return Image.asset('assets/images/closed.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(field),
      onLongPress: () => onChangeMarkup(field),
      child: _getImage(),
    );
  }
}
