// ignore_for_file: prefer_const_constructors

import 'package:api_client/api_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FortifyCardData', () {
    final fortifyCardData = FortifyCardData(
        title: 'Armbar',
        description: 'A submission technique.',
        imageUrl: 'http://example.com/armbar.png',
        category: CategoryData.pass,
        startingPosition: StartingPositionData.guard,
        earnedCardDate: 'earnedDate',
        timesHitLiveRounds: 'timesHitLiveRounds',
        lastTimeDrilled: 'lastTimeDrilled',
        timesTaught: 'timesTaught');

    test('can be de-serialized', () {
      expect(
        FortifyCardData.fromJson(fortifyCardData.toJson()),
        equals(
          fortifyCardData,
        ),
      );
    });
  });
}
