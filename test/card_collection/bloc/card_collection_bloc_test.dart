// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:card_repository/card_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fortify/card_collection/card_collection.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardRepository extends Mock implements CardRepository {}

void main() {
  late CardRepository cardRepository;

  final earnedCards = [
    FortifyCard(
      category: Category.pass,
      startingPosition: StartingPosition.standing,
      title: 'Hip Pin Pass',
      description: 'List Steps',
      imageUrl: '',
      earnedCardDate: 'earnedDate',
      timesTaught: 'timesTaught',
      timesHitLiveRounds: 'timesHitLiveRounds',
      lastTimeDrilled: 'lastTimeDrilled',
    ),
    FortifyCard(
      category: Category.submission,
      startingPosition: StartingPosition.halfGuard,
      title: 'Kimura',
      description: 'List Steps',
      imageUrl: '',
      earnedCardDate: 'earnedDate',
      timesTaught: 'timesTaught',
      timesHitLiveRounds: 'timesHitLiveRounds',
      lastTimeDrilled: 'lastTimeDrilled',
    ),
    FortifyCard(
      category: Category.takedown,
      startingPosition: StartingPosition.standing,
      title: 'Double Leg',
      description: 'List Steps',
      imageUrl: '',
      earnedCardDate: 'earnedDate',
      timesTaught: 'timesTaught',
      timesHitLiveRounds: 'timesHitLiveRounds',
      lastTimeDrilled: 'lastTimeDrilled',
    ),
  ];
  setUp(() {
    cardRepository = _MockCardRepository();
  });

  group('CardRepository', () {
    test('returns earned cards', () async {
      when(() => cardRepository.getCards()).thenAnswer(
        (_) => Future.value(earnedCards),
      );

      final cards = await cardRepository.getCards();
      expect(cards, earnedCards);
    });

    blocTest<CardCollectionBloc, CardCollectionState>(
      'Emits correct state ',
      setUp: () => when(() => cardRepository.getCards()).thenAnswer(
        (_) => Future.value(earnedCards),
      ),
      build: () => CardCollectionBloc(cardRepository: cardRepository),
      act: (bloc) => bloc.add(CardCollectionRequested()),
      expect: () => <CardCollectionState>[
        CardCollectionState(
          status: PageStatus.loading,
        ),
        CardCollectionState(
          earnedCards: earnedCards,
          status: PageStatus.success,
        ),
      ],
    );
  });

  test('gets correct category text when category is [Category.pass]', () {
    final cardCollectionBloc =
        CardCollectionBloc(cardRepository: cardRepository);
    expect(cardCollectionBloc.getCategoryText(earnedCards, 0), 'Pass');
  });

  test('gets correct category text when category is [Category.submission]', () {
    final cardCollectionBloc =
        CardCollectionBloc(cardRepository: cardRepository);
    expect(cardCollectionBloc.getCategoryText(earnedCards, 1), 'Submission');
  });

  test('gets correct category text when category is [Category.takedown]', () {
    final cardCollectionBloc =
        CardCollectionBloc(cardRepository: cardRepository);
    expect(cardCollectionBloc.getCategoryText(earnedCards, 2), 'Takedown');
  });

  test('gets correct color', () {
    final cardCollectionBloc =
        CardCollectionBloc(cardRepository: cardRepository);
    expect(cardCollectionBloc.getCategoryColor(earnedCards, 0), Colors.green);
  });

  test('gets correct color', () {
    final cardCollectionBloc =
        CardCollectionBloc(cardRepository: cardRepository);
    expect(cardCollectionBloc.getCategoryColor(earnedCards, 1), Colors.red);
  });

  test('gets correct color', () {
    final cardCollectionBloc =
        CardCollectionBloc(cardRepository: cardRepository);
    expect(cardCollectionBloc.getCategoryColor(earnedCards, 2), Colors.orange);
  });
}
