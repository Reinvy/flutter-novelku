import 'package:freezed_annotation/freezed_annotation.dart';

import 'author.dart';

part 'novel.freezed.dart';
part 'novel.g.dart';

@freezed
abstract class Novel with _$Novel {
  const Novel._();

  const factory Novel({
    required String id,
    required String title,
    required String synopsis,
    required String status,
    String? coverUrl,
    required Author author,
    required int chapterCount,
    required int ratingCount,
    double? averageRating,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Novel;

  factory Novel.fromJson(Map<String, dynamic> json) => _$NovelFromJson(json);

  bool get isCompleted => status == 'COMPLETED';
}
