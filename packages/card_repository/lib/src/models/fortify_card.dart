import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Enum representing the categories of techniques or actions.
enum Category {
  /// A technique where an individual sweeps their opponent.
  sweep,

  /// A technique where an individual passes their opponent's guard.
  pass,

  /// A technique where an individual submits their opponent.
  submission,

  /// A technique where an individual takes down their opponent.
  takedown,
}

/// Enum representing various starting positions in grappling or martial arts.
enum StartingPosition {
  /// Starting position where both competitors are standing.
  standing,

  /// Starting position where one competitor is on top of the other,
  /// sitting on their chest.
  mount,

  /// Starting position where one competitor is on top of the other,
  /// controlling from the side.
  sideControl,

  /// Starting position where one competitor is on top of the other,
  /// with one of the bottom competitor's legs trapped.
  halfGuard,

  /// Starting position where one competitor is on their back,
  /// with the other competitor between their legs.
  guard,

  /// Starting position similar to guard but with the bottom competitor's
  /// legs and feet positioned in a different way.
  quarterGuard,

  /// Starting position where one competitor has a single leg of the opponent
  /// trapped, often used for setting up takedowns or sweeps.
  singleLegX,
}

/// A class representing a card with details about a technique or action.
class FortifyCard extends Equatable {
  /// Creates a [FortifyCard] with the given [title], [description], [imageUrl],and [category].
  const FortifyCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
  });

  /// The title of the card, usually representing the name of the technique or action.
  final String title;

  /// A description of the card, providing details about the technique or action.
  final String description;

  /// The URL of the image associated with the card.
  final String imageUrl;

  /// The category of the technique or action represented by the card.
  final Category category;

  /// The color associated with the category of the card.
  Color get categoryColor {
    switch (category) {
      case Category.sweep:
        return Colors.blue;
      case Category.pass:
        return Colors.green;
      case Category.submission:
        return Colors.red;
      case Category.takedown:
        return Colors.orange;
    }
  }

  /// Creates a copy of this [FortifyCard] but with the
  /// given parameters replaced by new values.
  FortifyCard copyWith({
    String? title,
    String? description,
    String? imageUrl,
    Category? category,
  }) {
    return FortifyCard(
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [title, description, imageUrl, category];
}
