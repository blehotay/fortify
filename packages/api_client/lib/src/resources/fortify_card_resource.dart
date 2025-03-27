import 'dart:convert';

import 'package:api_client/api_client.dart';

/// {@template fortify_card_data}
/// A class representing a fortify card.
/// {@endtemplate}
class FortifyCardResource {
  /// {@macro fortify_card_data}
  FortifyCardResource({
    required ApiClient client,
  }) : _client = client;

  final ApiClient _client;

  /// Fetches a list of fortify cards.
  Future<List<FortifyCardData>> getFortifyCards({String? userId}) async {
    try {
      // userId ?? = _client.currentUserId;
      final response = await _client.get('/earned-cards');
      final body = response.body;

      final json = jsonDecode(body) as Map<String, dynamic>;
      final cardList = json['data'] as List<dynamic>;

      return cardList.map((json) {
        return FortifyCardData.fromJson(json as Map<String, dynamic>);
      }).toList();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetEarnedCardsException(error), stackTrace);
    }
  }
}

/// {@template get_earned_cards_exception}
/// Exception thrown when unable to get earned cards
/// {@endtemplate}
class GetEarnedCardsException implements Exception {
  /// {@macro get_earned_cards_exception}
  GetEarnedCardsException(this.error);

  /// The error thrown when unable to get earned cards
  final Object error;
}
