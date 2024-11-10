// ignore_for_file: prefer_const_constructors

import 'package:card_repository/card_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fortify/card_collection/card_collection.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class _MockCardCollectionBloc extends Mock implements CardCollectionBloc {}

class _MockCardRepository extends Mock implements CardRepository {}

void main() {
  late CardCollectionBloc mockCardColelctionBloc;
  late CardRepository cardRepository;

  final earnedCards = [
    FortifyCard(
      category: Category.pass,
      title: 'Hip Pin Pass',
      description: 'List Steps',
      imageUrl: '',
    ),
    FortifyCard(
      category: Category.submission,
      title: 'Kimura',
      description: 'List Steps',
      imageUrl: '',
    ),
  ];
  setUp(() {
    mockCardColelctionBloc = _MockCardCollectionBloc();
    cardRepository = _MockCardRepository();
  });

  Widget widetToTest() => BlocProvider.value(
        value: mockCardColelctionBloc,
        child: Scaffold(
          // TODO(question): Why wont CardCollectionView work here?
          body: CardCollectionPage(),
        ),
      );

  group('CardCollectionView', () {
    testWidgets('renders CardCollectionView', (tester) async {
      when(() => cardRepository.getCards()).thenAnswer(
        (_) => Future.value(earnedCards),
      );

      when(() => mockCardColelctionBloc.state).thenReturn(
        CardCollectionState(
          status: PageStatus.success,
          earnedCards: earnedCards,
        ),
      );
      await tester.pumpApp(widetToTest());
      expect(find.byType(CardCollectionView), findsOneWidget);
    });

    testWidgets('renders CirclularProgressIndicator when status is initial',
        (tester) async {
      when(() => cardRepository.getCards()).thenAnswer(
        (_) => Future.value(earnedCards),
      );
      when(() => mockCardColelctionBloc.state).thenReturn(
        CardCollectionState(
          earnedCards: earnedCards,
        ),
      );
      await tester.pumpApp(widetToTest());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders CirclularProgressIndicator when status is loading',
        (tester) async {
      when(() => cardRepository.getCards()).thenAnswer(
        (_) => Future.value(earnedCards),
      );
      when(() => mockCardColelctionBloc.state).thenReturn(
        CardCollectionState(
          status: PageStatus.loading,
          earnedCards: earnedCards,
        ),
      );
      await tester.pumpApp(widetToTest());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders Error Text when status is error', (tester) async {
      when(() => cardRepository.getCards()).thenThrow(Exception());
      when(() => mockCardColelctionBloc.state).thenReturn(
        CardCollectionState(
          status: PageStatus.error,
        ),
      );
      await tester.pumpApp(
        BlocProvider.value(
          value: mockCardColelctionBloc,
          child: Scaffold(
            body: CardCollectionPage(),
          ),
        ),
        cardRepository: cardRepository,
      );
      expect(find.text('Error'), findsOneWidget);
    });
  });
}