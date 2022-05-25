import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/models/board.dart';

main() {
  test('Win the game', () {
    Board board = Board(
      rows: 2,
      columns: 2,
      qtyMines: 0,
    );

    board.fields[0].mine();
    board.fields[3].mine();

    board.fields[0].changeMarkup();
    board.fields[1].open();
    board.fields[2].open();
    board.fields[3].changeMarkup();

    expect(board.resolved, isTrue);
  });
}
