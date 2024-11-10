// ignore_for_file: prefer_const_constructors

import 'package:card_repository/card_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardRepository extends Mock implements CardRepository {}

// extension PumpApp on WidgetTester {
//   Future<void> pumpApp(Widget widget) {
//     return pumpWidget(
//       MaterialApp(
//         localizationsDelegates: AppLocalizations.localizationsDelegates,
//         supportedLocales: AppLocalizations.supportedLocales,
//         home: widget,
//       ),
//     );
//   }
// }

extension AppTester on WidgetTester {
  Future<void> pumpApp(
    Widget widgetUnderTest, {
    CardRepository? cardRepository,
  }) async {
    final innerChild = Scaffold(body: widgetUnderTest);
    await pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: cardRepository ?? _MockCardRepository(),
          ),
        ],
        child: MaterialApp(home: innerChild),
      ),
    );
  }
}
