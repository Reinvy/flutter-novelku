import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@freezed
abstract class Chapter with _$Chapter {
  const factory Chapter({
    required String id,
    required String novelId,
    required String title,
    required String content,
    required int order,
    DateTime? createdAt,
    ChapterNovel? novel,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
}

@freezed
abstract class ChapterNovel with _$ChapterNovel {
  const factory ChapterNovel({
    required String id,
    required String title,
    String? coverUrl,
    String? authorId,
  }) = _ChapterNovel;

  factory ChapterNovel.fromJson(Map<String, dynamic> json) => _$ChapterNovelFromJson(json);
}
