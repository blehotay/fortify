// ignore_for_file: prefer_const_constructors

import 'package:card_repository/card_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardRepository extends Mock implements CardRepository {}

void main() {
  late CardRepository cardRepository;
  final playerCards = [
    const FortifyCard(
      category: Category.pass,
      title: 'Hip Pin Pass',
      description: 'List Steps',
      imageUrl: '',
    ),
    const FortifyCard(
      category: Category.submission,
      title: 'Kimura',
      description: 'List Steps',
      imageUrl: '',
    )
  ];

  setUp(() {
    cardRepository = _MockCardRepository();

    when(() => cardRepository.getCards()).thenAnswer(
      (_) => Future.value(
        playerCards,
      ),
    );
  });
  group('CardRepository', () {
    test('can be instantiated', () {
      expect(CardRepository(), isNotNull);
    });

    // TODO(ben): fix text so it hits breakpoint in repo
    test('fetchCards returns a list of FortifyCard', () async {
      final cards = cardRepository.getCards();

      expect(cards, isA<Future<List<FortifyCard>>>());
    });
  });
}
