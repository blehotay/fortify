// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  testWidgets('FortifyCardFront', (tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: FortifyCardFrontSelectedView(
            categoryText: 'category',
            imageUrl: 'imageUrl',
            title: 'title',
            categoryColor: Colors.red,
            issuedDate: 'earnedDate',
            timesTaught: 'timesTaught',
            timesHitLiveRounds: 'timesHitLiveRounds',
            lastTimeDrilled: 'lastTimeDrilled',
            description: 'description',
          ),
        ),
      );
    });

    expect(find.byType(FortifyCardFrontSelectedView), findsOneWidget);
  });

  testWidgets('FortifyCardFront finds contents ', (tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: FortifyCardFrontSelectedView(
            categoryText: 'category',
            imageUrl: 'imageUrl',
            title: 'title',
            categoryColor: Colors.red,
            issuedDate: 'earnedDate',
            timesTaught: 'timesTaught',
            timesHitLiveRounds: 'timesHitLiveRounds',
            lastTimeDrilled: 'lastTimeDrilled',
            description: 'description',
          ),
        ),
      );
    });

    expect(find.byType(TitleAndCategory), findsOneWidget);
    expect(find.byType(ImageSection), findsOneWidget);
    expect(find.byType(DetailWidget), findsOneWidget);
  });
}
