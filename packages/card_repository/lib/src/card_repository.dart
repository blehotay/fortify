import 'package:api_client/api_client.dart';
import 'package:card_repository/card_repository.dart';

/// mocked cards
final playerCards = [
  const FortifyCard(
    category: Category.pass,
    startingPosition: StartingPosition.standing,
    title: 'Knee Slice',
    description: 'List Steps',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4DMKAHIeuixNtiW5l_dK-TdBnYblDOwvDsQ&s',
  ),
  const FortifyCard(
    category: Category.submission,
    startingPosition: StartingPosition.halfGuard,
    title: 'Kimura',
    description: 'List Steps',
    imageUrl:
        'https://bjj-world.com/wp-content/uploads/2021/04/kimura-lock.jpg',
  ),
  const FortifyCard(
    category: Category.sweep,
    startingPosition: StartingPosition.guard,
    title: 'Flower Sweep',
    description: 'List Steps',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbXrccDhCHTCfYZzEf1oaDH0huJ8hJ8ETAUQ&s',
  ),
  const FortifyCard(
    category: Category.submission,
    startingPosition: StartingPosition.guard,
    title: 'Arm Bar from Guard',
    description: 'List Steps',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnRwpzyP92rCKQBuHkWwKRXhfVcA5kt35idw&s',
  ),
  const FortifyCard(
    category: Category.takedown,
    startingPosition: StartingPosition.standing,
    title: 'Double Leg',
    description: 'List Steps',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCn8cjckWaTpUehz6U9Y81aUGHgeYTjRz2Xg&s',
  ),
  const FortifyCard(
    category: Category.pass,
    startingPosition: StartingPosition.standing,
    title: 'Open Guard Pass',
    description: 'List Steps',
    imageUrl: 'https://www.bjjee.com/wp-content/uploads/2020/05/keenan.jpg',
  ),
];

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
      // final cardList = (await _fortifyCardResource.getFortifyCards())
      //     .map((data) => FortifyCard(
      //           title: data.title,
      //           description: data.descripton,
      //           imageUrl: data.imageUrl,
      //           // TODO(ben): Convert data.category and data.startingPosition to Category and StartingPosition
      //           category: data.category as Category,
      //           startingPosition: data.startingPosition as StartingPosition,
      //         ))
      //     .toList();
      final cardList = playerCards;
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
