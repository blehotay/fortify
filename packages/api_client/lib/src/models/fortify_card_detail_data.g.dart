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
      description: json['description'] as String,
      lastTimeDrilled: json['lastTimeDrilled'] as String,
      timesHitLiveRounds: json['timesHitLiveRounds'] as String,
      earnedCardDate: json['earnedCardDate'] as String,
      timesTaught: json['timesTaught'] as String,
    );

Map<String, dynamic> _$FortifyCardDataToJson(FortifyCardData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'category': _$CategoryDataEnumMap[instance.category]!,
      'startingPosition':
          _$StartingPositionDataEnumMap[instance.startingPosition]!,
      'description': instance.description,
      'timesHitLiveRounds': instance.timesHitLiveRounds,
      'timesTaught': instance.timesTaught,
      'lastTimeDrilled': instance.lastTimeDrilled,
      'earnedCardDate': instance.earnedCardDate,
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
