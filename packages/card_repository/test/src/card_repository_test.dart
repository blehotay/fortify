// ignore_for_file: prefer_const_constructors

import 'package:api_client/api_client.dart';
import 'package:card_repository/card_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardRepository extends Mock implements CardRepository {}

class _MockFortifyCardResource extends Mock implements FortifyCardResource {}

void main() {
  late CardRepository cardRepository;
  late FortifyCardResource fortifyCardResource;

  final playerCards = [
    const FortifyCard(
      category: Category.pass,
      title: 'Hip Pin Pass',
      description: 'List Steps',
      imageUrl: '',
      startingPosition: StartingPosition.standing,
    ),
    const FortifyCard(
      category: Category.submission,
      title: 'Kimura',
      description: 'List Steps',
      imageUrl: '',
      startingPosition: StartingPosition.halfGuard,
    ),
  ];

  setUp(() {
    cardRepository = _MockCardRepository();
    fortifyCardResource = _MockFortifyCardResource();

    when(() => cardRepository.getCards()).thenAnswer(
      (_) => Future.value(
        playerCards,
      ),
    );
  });
  group('CardRepository', () {
    test('can be instantiated', () {
      expect(
        CardRepository(fortifyCardResource: fortifyCardResource),
        isNotNull,
      );
    });

    // TODO(ben): fix text so it hits breakpoint in repo
    test('fetchCards returns a list of FortifyCard', () async {
      final cards = cardRepository.getCards();

      expect(cards, isA<Future<List<FortifyCard>>>());
    });
  });
}
