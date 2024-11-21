// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fortify_card_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FortifyCardData _$FortifyCardDataFromJson(Map<String, dynamic> json) =>
    FortifyCardData(
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      category: $enumDecode(_$CategoryDataEnumMap, json['category']),
      startingPosition:
          $enumDecode(_$StartingPositionDataEnumMap, json['startingPosition']),
      descripton: json['descripton'] as String,
    );

Map<String, dynamic> _$FortifyCardDataToJson(FortifyCardData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'category': _$CategoryDataEnumMap[instance.category]!,
      'startingPosition':
          _$StartingPositionDataEnumMap[instance.startingPosition]!,
      'descripton': instance.descripton,
    };

const _$CategoryDataEnumMap = {
  CategoryData.sweep: 'sweep',
  CategoryData.pass: 'pass',
  CategoryData.submission: 'submission',
  CategoryData.takedown: 'takedown',
};

const _$StartingPositionDataEnumMap = {
  StartingPositionData.standing: 'standing',
  StartingPositionData.mount: 'mount',
  StartingPositionData.sideControl: 'sideControl',
  StartingPositionData.halfGuard: 'halfGuard',
  StartingPositionData.guard: 'guard',
  StartingPositionData.quarterGuard: 'quarterGuard',
  StartingPositionData.singleLegX: 'singleLegX',
};
