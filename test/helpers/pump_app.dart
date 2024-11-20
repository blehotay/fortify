// ignore_for_file: prefer_const_constructors

import 'package:card_repository/card_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fortify/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nes_ui/nes_ui.dart';

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
    Locale? locale,
  }) async {
    final innerChild = Scaffold(body: widgetUnderTest);
    await pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: cardRepository ?? _MockCardRepository(),
          ),
        ],
        child: MaterialApp(
          theme: flutterNesTheme(),
          // color: Colors.white,
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            // AppUiLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale,
          home: innerChild,
        ),
      ),
    );
  }
}
