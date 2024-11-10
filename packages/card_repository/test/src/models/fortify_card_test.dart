import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:card_repository/src/models/fortify_card.dart';

void main() {
  group('FortifyCard', () {
    const card = FortifyCard(
      title: 'Armbar',
      description: 'A submission technique.',
      imageUrl: 'http://example.com/armbar.png',
      category: Category.submission,
    );

    const card2 = FortifyCard(
      title: 'Armbar',
      description: 'A submission technique.',
      imageUrl: 'http://example.com/armbar.png',
      category: Category.pass,
    );

    test('supports value equality', () {
      expect(card, card);
      expect(card, isNot(equals(card2)));
    });

    test('copyWith creates a copy with updated values', () {
      final updatedCard = card.copyWith(
        title: 'Updated Title',
        description: 'Updated Description',
        imageUrl: 'http://example.com/updated.png',
        category: Category.pass,
      );

      expect(updatedCard.title, 'Updated Title');
      expect(updatedCard.description, 'Updated Description');
      expect(updatedCard.imageUrl, 'http://example.com/updated.png');
      expect(updatedCard.category, Category.pass);
    });

    test('copyWith retains old values if no new values are provided', () {
      final updatedCard = card.copyWith();

      expect(updatedCard.title, 'Armbar');
      expect(updatedCard.description, 'A submission technique.');
      expect(updatedCard.imageUrl, 'http://example.com/armbar.png');
      expect(updatedCard.category, Category.submission);
    });

    test('props returns correct values', () {
      expect(card.props,
          [card.title, card.description, card.imageUrl, card.category]);
    });
  });
}
