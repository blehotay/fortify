// ignore_for_file: prefer_const_constructors

import 'package:api_client/api_client.dart';
import 'package:card_repository/card_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardRepository extends Mock implements CardRepository {}

class _MockFortifyCardResource extends Mock implements FortifyCardResource {}

void main() {
  final cardRepository = _MockCardRepository();
  final fortifyCardResource = _MockFortifyCardResource();

  final playerCards = [
    const FortifyCard(
      category: Category.pass,
      title: 'Hip Pin Pass',
      description: 'List Steps',
      imageUrl: 'imageUrl',
      startingPosition: StartingPosition.standing,
      issuedDate: 'earnedDate',
      timesTaught: 'timesTaught',
      timesHitLiveRounds: 'timesHitLiveRounds',
      lastTimeDrilled: 'lastTimeDrilled',
    ),
    const FortifyCard(
      category: Category.submission,
      title: 'Kimura',
      description: 'List Steps',
      imageUrl: 'imageUrl',
      startingPosition: StartingPosition.halfGuard,
      issuedDate: 'earnedDate',
      timesTaught: 'timesTaught',
      timesHitLiveRounds: 'timesHitLiveRounds',
      lastTimeDrilled: 'lastTimeDrilled',
    ),
  ];

  final playerCardsData = [
    const FortifyCardData(
      category: CategoryData.pass,
      title: 'Hip Pin Pass',
      description: 'List Steps',
      imageUrl: 'imageUrl',
      startingPosition: StartingPositionData.standing,
      issuedDateData: 'earnedDate',
      timesTaught: 'timesTaught',
      timesHitLiveRounds: 'timesHitLiveRounds',
      lastTimeDrilled: 'lastTimeDrilled',
    ),
    const FortifyCardData(
      category: CategoryData.submission,
      title: 'Kimura',
      description: 'List Steps',
      imageUrl: 'imageUrl',
      startingPosition: StartingPositionData.halfGuard,
      issuedDateData: 'earnedDate',
      timesTaught: 'timesTaught',
      timesHitLiveRounds: 'timesHitLiveRounds',
      lastTimeDrilled: 'lastTimeDrilled',
    ),
  ];

  group('CardRepository', () {
    setUp(() {
      // cardRepository = _MockCardRepository();
      // fortifyCardResource = _MockFortifyCardResource();

      when(
        cardRepository.getCards,
      ).thenAnswer((_) => Future.value(playerCards));

      when(
        fortifyCardResource.getFortifyCards,
      ).thenAnswer((_) async => playerCardsData);
    });

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

    test('returns a list of FortifyCardData', () {
      when(
        fortifyCardResource.getFortifyCards,
      ).thenAnswer((_) => Future.value(playerCardsData));

      when(
        cardRepository.getCards,
      ).thenAnswer((_) => Future.value(playerCards));

      final result = cardRepository.getCards();

      expect(result, isNotNull);
    });

    test('throws GetCardsFailure when exception occurs', () async {
      when(
        cardRepository.getCards,
      ).thenThrow(
        Exception(),
      );
      expect(
        cardRepository.getCards,
        throwsA(
          isA<GetCardsFailure>(),
        ),
      );
    });
  });
}
