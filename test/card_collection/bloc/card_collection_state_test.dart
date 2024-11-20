// ignore_for_file: prefer_const_constructors

import 'package:card_repository/card_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fortify/card_collection/card_collection.dart';

void main() {
  group('CardCollectionState', () {
    final earnedCards = [
      FortifyCard(
        category: Category.pass,
        startingPosition: StartingPosition.standing,
        title: 'Hip Pin Pass',
        description: 'List Steps',
        imageUrl: '',
      ),
      FortifyCard(
        category: Category.submission,
        startingPosition: StartingPosition.halfGuard,
        title: 'Kimura',
        description: 'List Steps',
        imageUrl: '',
      ),
    ];
    test('supports value comparisons', () {
      expect(CardCollectionState(), equals(CardCollectionState()));
    });

    test('can copyWith', () {
      expect(
        CardCollectionState().copyWith(
          earnedCards: earnedCards,
        ),
        equals(CardCollectionState(earnedCards: earnedCards)),
      );
    });

    test('gets correct category color', () {});
  });
}
