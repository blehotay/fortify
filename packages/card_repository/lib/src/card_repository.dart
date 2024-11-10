import 'package:card_repository/card_repository.dart';
import 'package:flutter/material.dart';

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
  )
];

/// {@template card_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class CardRepository {
  /// {@macro card_repository}
  const CardRepository();

  /// Fetches a list of [FortifyCard]s.
  Future<List<FortifyCard>> getCards() async {
    const Duration(seconds: 3);
    return playerCards;
  }
}

abstract class CardRepositoryException implements Exception {
  const CardRepositoryException(this.error);

  final Object error;
}

class GetCardsFailure extends CardRepositoryException {
  const GetCardsFailure(super.error);
}
