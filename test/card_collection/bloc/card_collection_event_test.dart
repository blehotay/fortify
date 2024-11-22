// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:fortify/card_collection/card_collection.dart';

void main() {
  group('CardCollectionEvent', () {
    group('CardCollectionRequested', () {
      test('supports value comparisons', () {
        expect(CardCollectionRequested(), equals(CardCollectionRequested()));
      });
    });
  });
}
