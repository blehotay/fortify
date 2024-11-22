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
  ];

  setUp(() {
    mockCardColelctionBloc = _MockCardCollectionBloc();
    cardRepository = _MockCardRepository();
  });

  Widget buildSubject() {
    return BlocProvider(
      create: (context) => mockCardColelctionBloc,
      child: CardCollectionPage(),
    );
  }

  group('CardCollectionPage', () {
    testWidgets('renders CardCollectionPage', (tester) async {
      when(() => cardRepository.getCards()).thenAnswer(
        (_) => Future.value(earnedCards),
      );
      when(() => mockCardColelctionBloc.state).thenReturn(
        CardCollectionState(
          status: PageStatus.success,
          earnedCards: earnedCards,
        ),
      );

      await tester.pumpApp(buildSubject());

      expect(find.byType(CardCollectionView), findsOneWidget);
    });
  });
}
