// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class _MockApiClient extends Mock implements ApiClient {}

void main() {
  group('FortifyCardResource', () {
    final mockClient = _MockApiClient();

    test('can instantiate FortifyCardResource', () {
      expect(FortifyCardResource(client: mockClient), isNotNull);
    });

    test('can getCards', () async {
      when(() => mockClient.get(any())).thenAnswer(
        (_) => Future.value(
          http.Response(
            jsonEncode({
              'data': [
                {
                  'category': 'pass',
                  'startingPosition': 'standing',
                  'title': 'Knee Slice',
                  'description':
                      "A versatile guard pass where you slice your knee through the opponent's legs while maintaining control of their upper body. This technique is effective for breaking through various guard styles.",
                  'imageUrl':
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4DMKAHIeuixNtiW5l_dK-TdBnYblDOwvDsQ&s',
                },
              ],
            }),
            200,
          ),
        ),
      );
      final resource = FortifyCardResource(client: mockClient);
      expect(resource.getFortifyCards(), completes);
    });

    test('throws a GetEarnedCardsException when something goes wrong', () {
      when(
        () => mockClient.get(any()),
      ).thenThrow(Exception());

      final resource = FortifyCardResource(client: mockClient);
      expect(
        () async => resource.getFortifyCards(),
        throwsA(
          isA<GetEarnedCardsException>(),
        ),
      );
    });
  });
}
