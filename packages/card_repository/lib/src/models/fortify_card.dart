import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';

/// Enum representing the categories of techniques or actions.
enum Category {
  /// A technique where an individual sweeps their opponent.
  sweep,

  /// A technique where an individual passes their opponent's guard.
  pass,

  /// A technique where an individual submits their opponent.
  submission,

  /// A technique where an individual takes down their opponent.
  takedown;

  /// convert from [CategoryData]
  static Category convertToCategory(CategoryData categoryData) =>
      switch (categoryData) {
        CategoryData.sweep => Category.sweep,
        CategoryData.pass => Category.pass,
        CategoryData.submission => Category.submission,
        CategoryData.takedown => Category.takedown,
      };

  /// convert to [CategoryData]
  static CategoryData convertToCategoryData(Category category) =>
      switch (category) {
        Category.sweep => CategoryData.sweep,
        Category.pass => CategoryData.pass,
        Category.submission => CategoryData.submission,
        Category.takedown => CategoryData.takedown,
      };
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
  singleLegX;

  /// convert from StartingPositionData
  static StartingPosition convertToStartingPosition(
    StartingPositionData startingPositionData,
  ) =>
      switch (startingPositionData) {
        StartingPositionData.standing => StartingPosition.standing,
        StartingPositionData.mount => StartingPosition.mount,
        StartingPositionData.sideControl => StartingPosition.sideControl,
        StartingPositionData.halfGuard => StartingPosition.halfGuard,
        StartingPositionData.guard => StartingPosition.guard,
        StartingPositionData.quarterGuard => StartingPosition.quarterGuard,
        StartingPositionData.singleLegX => StartingPosition.singleLegX,
      };

  /// convert to StartingPosition
  static StartingPositionData convertToStartingPositionData(
    StartingPosition startingPosition,
  ) =>
      switch (startingPosition) {
        StartingPosition.standing => StartingPositionData.standing,
        StartingPosition.mount => StartingPositionData.mount,
        StartingPosition.sideControl => StartingPositionData.sideControl,
        StartingPosition.halfGuard => StartingPositionData.halfGuard,
        StartingPosition.guard => StartingPositionData.guard,
        StartingPosition.quarterGuard => StartingPositionData.quarterGuard,
        StartingPosition.singleLegX => StartingPositionData.singleLegX,
      };
}

/// A class representing a card with details about a technique or action.
class FortifyCard extends Equatable {
  /// Creates a [FortifyCard] with the given [title], [description],
  /// [imageUrl],[startingPosition],and [category].
  const FortifyCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.startingPosition,
    required this.lastTimeDrilled,
    required this.timesHitLiveRounds,
    required this.issuedDate,
    required this.timesTaught,
  });

  /// The title of the card, usually representing the name of the technique
  /// or action.
  final String title;

  /// A description of the card, providing details about the technique or
  /// action.
  final String description;

  /// The URL of the image associated with the card.
  final String imageUrl;

  /// The category of the technique or action represented by the card.
  final Category category;

  /// The starting position for the technique or action represented by the card.
  final StartingPosition startingPosition;

  /// The amount of times the user has hit this move in a live round.
  final String timesHitLiveRounds;

  /// The amount of times a user has been taught.
  final String timesTaught;

  /// The last time this move was drilled.
  final String lastTimeDrilled;

  /// The date the card was issued.
  final String issuedDate;

  /// Creates a copy of this [FortifyCard] but with the
  /// given parameters replaced by new values.
  FortifyCard copyWith({
    String? title,
    String? description,
    String? imageUrl,
    Category? category,
    StartingPosition? startingPosition,
    String? timesHitLiveRounds,
    String? timesTaught,
    String? lastTimeDrilled,
    String? issuedDate,
  }) {
    return FortifyCard(
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      startingPosition: startingPosition ?? this.startingPosition,
      timesHitLiveRounds: timesHitLiveRounds ?? this.timesHitLiveRounds,
      timesTaught: timesTaught ?? this.timesTaught,
      lastTimeDrilled: lastTimeDrilled ?? this.lastTimeDrilled,
      issuedDate: issuedDate ?? this.issuedDate,
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        imageUrl,
        category,
        startingPosition,
        timesHitLiveRounds,
        timesTaught,
        lastTimeDrilled,
        issuedDate,
      ];
}
