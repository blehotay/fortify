import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fortify_card_detail_data.g.dart';

/// Enum representing the categories of techniques or actions.
enum CategoryData {
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
enum StartingPositionData {
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
@JsonSerializable()
class FortifyCardData extends Equatable {
  /// Creates a [FortifyCardData] with the given [title], [description],
  /// [imageUrl],[startingPosition],and [category].
  const FortifyCardData({
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.startingPosition,
    required this.description,
  });

  /// Creates a [FortifyCardData] from a json
  factory FortifyCardData.fromJson(Map<String, dynamic> json) =>
      _$FortifyCardDataFromJson(json);

  /// The title of the card.
  final String title;

  /// The image url of the card.
  final String imageUrl;

  /// The category of the card.
  final CategoryData category;

  /// The starting position of the card.
  final StartingPositionData startingPosition;

  /// The description of the card.
  final String description;

  /// Converts the current instance to a json
  Map<String, dynamic> toJson() => _$FortifyCardDataToJson(this);

  @override
  List<Object?> get props => [
        title,
        imageUrl,
        category,
        description,
        startingPosition,
      ];
}
