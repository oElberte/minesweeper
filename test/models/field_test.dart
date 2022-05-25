import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/models/field.dart';

main() {
  group('Field', () {
    test('Open field WITH explosion', () {
      Field f = Field(row: 0, column: 0);
      f.mine();

      expect(f.open, throwsException);
    });

    test('Open field WITHOUT explosion', () {
      Field f = Field(row: 0, column: 0);
      f.open();

      expect(f.opened, isTrue);
    });

    test('Add NO neighbor', () {
      Field f1 = Field(row: 0, column: 0);
      Field f2 = Field(row: 1, column: 3);

      f1.addNeighbor(f2);

      expect(f1.neighbors.isEmpty, isTrue);
    });

    test('Add neighbor', () {
      Field f1 = Field(row: 3, column: 3);
      Field f2 = Field(row: 3, column: 4);
      Field f3 = Field(row: 2, column: 2);
      Field f4 = Field(row: 4, column: 4);

      f1.addNeighbor(f2);
      f1.addNeighbor(f3);
      f1.addNeighbor(f4);

      expect(f1.neighbors.length, 3);
    });

    test('Mines in the neighborhood', () {
      Field f1 = Field(row: 3, column: 3);

      Field f2 = Field(row: 3, column: 4);
      f2.mine();
      Field f3 = Field(row: 2, column: 2);

      Field f4 = Field(row: 4, column: 4);
      f4.mine();

      f1.addNeighbor(f2);
      f1.addNeighbor(f3);
      f1.addNeighbor(f4);

      expect(f1.qtyMinesInNeighborhood, 2);
    });
  });
}
