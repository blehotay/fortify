import 'package:card_repository/card_repository.dart';

/// {@template card_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}

final playerCards = [
  const FortifyCard(
    category: Category.pass,
    title: 'Knee Slice',
    description: 'List Steps',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4DMKAHIeuixNtiW5l_dK-TdBnYblDOwvDsQ&s',
  ),
  const FortifyCard(
    category: Category.submission,
    title: 'Kimura',
    description: 'List Steps',
    imageUrl:
        'https://bjj-world.com/wp-content/uploads/2021/04/kimura-lock.jpg',
  ),
  const FortifyCard(
    category: Category.sweep,
    title: 'Flower Sweep',
    description: 'List Steps',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbXrccDhCHTCfYZzEf1oaDH0huJ8hJ8ETAUQ&s',
  ),
  const FortifyCard(
    category: Category.submission,
    title: 'Arm Bar from Guard',
    description: 'List Steps',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnRwpzyP92rCKQBuHkWwKRXhfVcA5kt35idw&s',
  ),
  const FortifyCard(
    category: Category.takedown,
    title: 'Double Leg',
    description: 'List Steps',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCn8cjckWaTpUehz6U9Y81aUGHgeYTjRz2Xg&s',
  ),
  const FortifyCard(
    category: Category.pass,
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
  const CardRepository();

  /// Fetches a list of [FortifyCard]s.
  /// Throws a [GetCardsFailure] if an error occurs.
  Future<List<FortifyCard>> getCards() async {
    try {
      return playerCards;
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
