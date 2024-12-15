import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fortify_card_category_data.g.dart';

/// A class representing a category for the card.
@JsonSerializable()
class FortifyCardCategoryData extends Equatable {
  /// Creates a [FortifyCardCategoryData] with [categoryData];
  const FortifyCardCategoryData({required this.categoryData});

  /// Creates a [FortifyCardCategoryData] from a json.
  factory FortifyCardCategoryData.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$FortifyCardCategoryDataFromJson(json);

  /// The category of the card.
  final String categoryData;

  /// Converts the current instance to json.
  Map<String, dynamic> toJson() => _$FortifyCardCategoryDataToJson(
        this,
      );

  @override
  List<Object?> get props => [categoryData];
}
