// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RatingInfo _$RatingInfoFromJson(Map<String, dynamic> json) => _RatingInfo(
  average: (json['average'] as num?)?.toDouble(),
  count: (json['count'] as num).toInt(),
  myRating: (json['myRating'] as num?)?.toInt(),
);

Map<String, dynamic> _$RatingInfoToJson(_RatingInfo instance) =>
    <String, dynamic>{
      'average': instance.average,
      'count': instance.count,
      'myRating': instance.myRating,
    };
