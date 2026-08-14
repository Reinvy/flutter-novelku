import 'package:freezed_annotation/freezed_annotation.dart';

part 'reading_history.freezed.dart';
part 'reading_history.g.dart';

@freezed
abstract class ReadingHistory with _$ReadingHistory {
  const factory ReadingHistory({
    required HistoryNovel novel,
    required HistoryChapter chapter,
    required int progress,
    required DateTime updatedAt,
  }) = _ReadingHistory;

  factory ReadingHistory.fromJson(Map<String, dynamic> json) => _$ReadingHistoryFromJson(json);
}

@freezed
abstract class HistoryNovel with _$HistoryNovel {
  const factory HistoryNovel({
    required String id,
    required String title,
    String? coverUrl,
    HistoryAuthor? author,
  }) = _HistoryNovel;

  factory HistoryNovel.fromJson(Map<String, dynamic> json) => _$HistoryNovelFromJson(json);
}

@freezed
abstract class HistoryAuthor with _$HistoryAuthor {
  const factory HistoryAuthor({required String name}) = _HistoryAuthor;

  factory HistoryAuthor.fromJson(Map<String, dynamic> json) => _$HistoryAuthorFromJson(json);
}

@freezed
abstract class HistoryChapter with _$HistoryChapter {
  const factory HistoryChapter({
    required String id,
    required String title,
    required int order,
  }) = _HistoryChapter;

  factory HistoryChapter.fromJson(Map<String, dynamic> json) => _$HistoryChapterFromJson(json);
}
