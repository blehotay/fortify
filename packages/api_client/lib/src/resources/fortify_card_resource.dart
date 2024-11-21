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
    // userId ?? = _client.currentUserId;
    final response = await _client.get('/fortify-cards');
    final body = response.body;

    final json = jsonDecode(body) as Map<String, dynamic>;
    final cardList = json['data'] as List<dynamic>;

    return cardList.map((json) {
      return FortifyCardData.fromJson(json as Map<String, dynamic>);
    }).toList();
  }
}
