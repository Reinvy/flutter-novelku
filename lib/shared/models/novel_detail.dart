import 'package:freezed_annotation/freezed_annotation.dart';

part 'novel_detail.freezed.dart';
part 'novel_detail.g.dart';

@freezed
abstract class ChapterSummary with _$ChapterSummary {
  const factory ChapterSummary({
    required String id,
    required String title,
    required int order,
    DateTime? createdAt,
  }) = _ChapterSummary;

  factory ChapterSummary.fromJson(Map<String, dynamic> json) => _$ChapterSummaryFromJson(json);
}

@freezed
abstract class NovelDetail with _$NovelDetail {
  const NovelDetail._();

  const factory NovelDetail({
    required String id,
    required String title,
    required String synopsis,
    required String status,
    String? coverUrl,
    required String authorId,
    required String authorName,
    String? authorAvatarUrl,
    required int chapterCount,
    required int ratingCount,
    double? averageRating,
    required List<ChapterSummary> chapters,
    int? myRating,
    bool? inLibrary,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _NovelDetail;

  factory NovelDetail.fromJson(Map<String, dynamic> json) => _$NovelDetailFromJson(json);

  bool get isCompleted => status == 'COMPLETED';
}
