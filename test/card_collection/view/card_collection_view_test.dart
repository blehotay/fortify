// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:card_repository/card_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fortify/card_collection/card_collection.dart';
import 'package:fortify/card_collection/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../helpers/helpers.dart';

class _MockCardCollectionBloc
    extends MockBloc<CardColectionEvent, CardCollectionState>
    implements CardCollectionBloc {}

// class _MockCardCollectionBloc extends Mock implements CardCollectionBloc {}

class _MockCardRepository extends Mock implements CardRepository {}

void main() {
  late CardCollectionBloc mockCardColelctionBloc;
  late CardRepository mockedCardRepository;

  final earnedCards = [
    FortifyCard(
      category: Category.pass,
      startingPosition: StartingPosition.standing,
      title: 'Hip Pin Pass',
      description: 'List Steps',
      imageUrl: 'imageurl',
    ),
    // FortifyCard(
    //   category: Category.submission,
    //   startingPosition: StartingPosition.halfGuard,
    //   title: 'Kimura',
    //   description: 'List Steps',
    //   imageUrl: 'imageurl',
    // ),
  ];

  group('CardCollectionView', () {
    setUp(() {
      mockCardColelctionBloc = _MockCardCollectionBloc();
      mockedCardRepository = _MockCardRepository();
      when(() => mockCardColelctionBloc.stream).thenAnswer(
        (_) => Stream.value(
          CardCollectionState(
            status: PageStatus.success,
            earnedCards: earnedCards,
          ),
        ),
      );

      when(() => mockedCardRepository.getCards()).thenAnswer(
        (_) => Future.value(earnedCards),
      );

      when(() => mockCardColelctionBloc.getcategoryColor(earnedCards, 0))
          .thenReturn(Colors.green);

      when(
        () => mockCardColelctionBloc.getcategoryText(earnedCards, 0),
      ).thenAnswer((_) => 'Pass');
    });
    testWidgets('renders CardCollectionView', (tester) async {
      when(() => mockCardColelctionBloc.state).thenReturn(
        CardCollectionState(
          status: PageStatus.success,
          earnedCards: earnedCards,
        ),
      );

      await mockNetworkImages(() async {
        await tester.pumpApp(
          BlocProvider.value(
            value: mockCardColelctionBloc,
            child: CardCollectionView(),
          ),
        );
      });

      expect(find.byType(CardCollectionView), findsOneWidget);
      expect(find.byType(CardCollectionSuccess), findsOneWidget);
    });

    testWidgets('renders SelectedCardView when card is tapped in grid view',
        (tester) async {
      when(
        () => mockCardColelctionBloc.state,
      ).thenReturn(
        CardCollectionState(
          earnedCards: earnedCards,
          status: PageStatus.success,
        ),
      );

      await mockNetworkImages(() async {
        await tester.pumpApp(
          BlocProvider.value(
            value: mockCardColelctionBloc,
            child: CardCollectionView(),
          ),
        );
      });

      await tester.tap(find.byType(CardViewCollection));
      await tester.pumpAndSettle();

      expect(find.byType(SelectedCardView), findsOneWidget);
    });

    testWidgets('renders CardCollectionErrorView', (tester) async {
      when(
        () => mockCardColelctionBloc.state,
      ).thenReturn(CardCollectionState(status: PageStatus.error));

      await mockNetworkImages(() async {
        await tester.pumpApp(
          BlocProvider.value(
            value: mockCardColelctionBloc,
            child: CardCollectionView(),
          ),
        );
      });

      expect(find.byType(CardCollectionErrorView), findsOneWidget);
    });

    testWidgets('renders CardCollectonLoadingView when status is initial',
        (tester) async {
      when(
        () => mockCardColelctionBloc.state,
      ).thenReturn(CardCollectionState());

      await mockNetworkImages(() async {
        await tester.pumpApp(
          BlocProvider.value(
            value: mockCardColelctionBloc,
            child: CardCollectionView(),
          ),
        );
      });

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(CardCollectionLoadingView), findsOneWidget);
    });

    testWidgets('renders CardCollectonLoadingView when status is loading',
        (tester) async {
      when(
        () => mockCardColelctionBloc.state,
      ).thenReturn(CardCollectionState(status: PageStatus.loading));

      await mockNetworkImages(() async {
        await tester.pumpApp(
          BlocProvider.value(
            value: mockCardColelctionBloc,
            child: CardCollectionView(),
          ),
        );
      });

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(CardCollectionLoadingView), findsOneWidget);
    });
  });
}
