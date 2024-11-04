// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  testWidgets('FortifyCardTemplate', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: flutterNesTheme(),
        home: FortifyCardTemplate(),
      ),
    );
    expect(find.byType(FortifyCardTemplate), findsOneWidget);
  });

  testWidgets('ForifyCardTemplate finds contents ', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: flutterNesTheme(),
        home: FortifyCardTemplate(
          contents: [Container()],
        ),
      ),
    );
    expect(find.byType(Container), findsOneWidget);
  });
}
