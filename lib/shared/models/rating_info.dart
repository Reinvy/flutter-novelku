import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_info.freezed.dart';
part 'rating_info.g.dart';

@freezed
abstract class RatingInfo with _$RatingInfo {
  const factory RatingInfo({
    double? average,
    required int count,
    int? myRating,
  }) = _RatingInfo;

  factory RatingInfo.fromJson(Map<String, dynamic> json) => _$RatingInfoFromJson(json);
}
