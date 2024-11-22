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
    extends MockBloc<CardCollectionEvent, CardCollectionState>
    implements CardCollectionBloc {}

// class _MockCardCollectionBloc extends Mock implements CardCollectionBloc {}

class _MockCardRepository extends Mock implements CardRepository {}

void main() {
  late CardCollectionBloc mockCardCollectionBloc;
  late CardRepository mockedCardRepository;

  final earnedCards = [
    FortifyCard(
      category: Category.pass,
      startingPosition: StartingPosition.standing,
      title: 'Hip Pin Pass',
      description: 'List Steps',
      imageUrl: 'imageUrl',
    ),
    // FortifyCard(
    //   category: Category.submission,
    //   startingPosition: StartingPosition.halfGuard,
    //   title: 'Kimura',
    //   description: 'List Steps',
    //   imageUrl: 'imageUrl',
    // ),
  ];

  group('CardCollectionView', () {
    setUp(() {
      mockCardCollectionBloc = _MockCardCollectionBloc();
      mockedCardRepository = _MockCardRepository();
      when(() => mockCardCollectionBloc.stream).thenAnswer(
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

      when(() => mockCardCollectionBloc.getCategoryColor(earnedCards, 0))
          .thenReturn(Colors.green);

      when(
        () => mockCardCollectionBloc.getCategoryText(earnedCards, 0),
      ).thenAnswer((_) => 'Pass');
    });
    testWidgets('renders CardCollectionView', (tester) async {
      when(() => mockCardCollectionBloc.state).thenReturn(
        CardCollectionState(
          status: PageStatus.success,
          earnedCards: earnedCards,
        ),
      );

      await mockNetworkImages(() async {
        await tester.pumpApp(
          BlocProvider.value(
            value: mockCardCollectionBloc,
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
        () => mockCardCollectionBloc.state,
      ).thenReturn(
        CardCollectionState(
          earnedCards: earnedCards,
          status: PageStatus.success,
        ),
      );

      await mockNetworkImages(() async {
        await tester.pumpApp(
          BlocProvider.value(
            value: mockCardCollectionBloc,
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
        () => mockCardCollectionBloc.state,
      ).thenReturn(CardCollectionState(status: PageStatus.error));

      await mockNetworkImages(() async {
        await tester.pumpApp(
          BlocProvider.value(
            value: mockCardCollectionBloc,
            child: CardCollectionView(),
          ),
        );
      });

      expect(find.byType(CardCollectionErrorView), findsOneWidget);
    });

    testWidgets('renders CardCollectionLoadingView when status is initial',
        (tester) async {
      when(
        () => mockCardCollectionBloc.state,
      ).thenReturn(CardCollectionState());

      await mockNetworkImages(() async {
        await tester.pumpApp(
          BlocProvider.value(
            value: mockCardCollectionBloc,
            child: CardCollectionView(),
          ),
        );
      });

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(CardCollectionLoadingView), findsOneWidget);
    });

    testWidgets('renders CardCollectionLoadingView when status is loading',
        (tester) async {
      when(
        () => mockCardCollectionBloc.state,
      ).thenReturn(CardCollectionState(status: PageStatus.loading));

      await mockNetworkImages(() async {
        await tester.pumpApp(
          BlocProvider.value(
            value: mockCardCollectionBloc,
            child: CardCollectionView(),
          ),
        );
      });

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(CardCollectionLoadingView), findsOneWidget);
    });
  });
}
