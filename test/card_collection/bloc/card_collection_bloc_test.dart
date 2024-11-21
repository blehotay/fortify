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
    ),
    FortifyCard(
      category: Category.submission,
      startingPosition: StartingPosition.halfGuard,
      title: 'Kimura',
      description: 'List Steps',
      imageUrl: '',
    ),
    FortifyCard(
      category: Category.takedown,
      startingPosition: StartingPosition.standing,
      title: 'Double Leg',
      description: 'List Steps',
      imageUrl: '',
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
      act: (bloc) => bloc.add(CardColectionRequested()),
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

  test('gets correct category text when catetory is [Category.pass]', () {
    final cardCollectionBloc =
        CardCollectionBloc(cardRepository: cardRepository);
    expect(cardCollectionBloc.getcategoryText(earnedCards, 0), 'Pass');
  });

  test('gets correct category text when catetory is [Category.submission]', () {
    final cardCollectionBloc =
        CardCollectionBloc(cardRepository: cardRepository);
    expect(cardCollectionBloc.getcategoryText(earnedCards, 1), 'Submission');
  });

  test('gets correct category text when catetory is [Category.takedown]', () {
    final cardCollectionBloc =
        CardCollectionBloc(cardRepository: cardRepository);
    expect(cardCollectionBloc.getcategoryText(earnedCards, 2), 'Takedown');
  });

  test('gets correct color', () {
    final cardCollectionBloc =
        CardCollectionBloc(cardRepository: cardRepository);
    expect(cardCollectionBloc.getcategoryColor(earnedCards, 0), Colors.green);
  });

  test('gets correct color', () {
    final cardCollectionBloc =
        CardCollectionBloc(cardRepository: cardRepository);
    expect(cardCollectionBloc.getcategoryColor(earnedCards, 1), Colors.red);
  });

  test('gets correct color', () {
    final cardCollectionBloc =
        CardCollectionBloc(cardRepository: cardRepository);
    expect(cardCollectionBloc.getcategoryColor(earnedCards, 2), Colors.orange);
  });
}
