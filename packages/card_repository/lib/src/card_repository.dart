import 'package:api_client/api_client.dart';
import 'package:card_repository/card_repository.dart';

/// {@template card_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class CardRepository {
  /// {@macro card_repository}
  const CardRepository({
    required FortifyCardResource fortifyCardResource,
  }) : _fortifyCardResource = fortifyCardResource;

  final FortifyCardResource _fortifyCardResource;

  /// Fetches a list of [FortifyCard]s.
  /// Throws a [GetCardsFailure] if an error occurs.
  Future<List<FortifyCard>> getCards() async {
    try {
      final cardList = (await _fortifyCardResource.getFortifyCards())
          .map(
            (data) => FortifyCard(
              title: data.title,
              description: data.description,
              imageUrl: data.imageUrl,
              category: Category.convertToCategory(data.category),
              startingPosition: StartingPosition.convertToStartingPosition(
                data.startingPosition,
              ),
              timesHitLiveRounds: data.timesHitLiveRounds,
              earnedCardDate: data.earnedCardDate,
              lastTimeDrilled: data.lastTimeDrilled,
              timesTaught: data.timesTaught,
            ),
          )
          .toList();
      return cardList;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetCardsFailure(error), stackTrace);
    }
  }
}

/// {@template card_repository_exception}
/// Exception thrown by the [CardRepository].
/// {@endtemplate}
abstract class CardRepositoryException implements Exception {
  /// {@macro card_repository_exception}
  const CardRepositoryException(this.error);

  /// The error message.
  final Object error;
}

/// {@template get_cards_failure}
/// Thrown when an error occurs fetching cards.
/// {@endtemplate}
class GetCardsFailure extends CardRepositoryException {
  /// {@macro get_cards_failure}
  const GetCardsFailure(super.error);
}
