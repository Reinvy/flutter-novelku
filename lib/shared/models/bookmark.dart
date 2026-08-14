import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark.freezed.dart';
part 'bookmark.g.dart';

@freezed
abstract class Bookmark with _$Bookmark {
  const factory Bookmark({
    required String id,
    required String title,
    required int order,
    required DateTime bookmarkedAt,
    required BookmarkNovel novel,
  }) = _Bookmark;

  factory Bookmark.fromJson(Map<String, dynamic> json) => _$BookmarkFromJson(json);
}

@freezed
abstract class BookmarkNovel with _$BookmarkNovel {
  const factory BookmarkNovel({
    required String id,
    required String title,
    String? coverUrl,
  }) = _BookmarkNovel;

  factory BookmarkNovel.fromJson(Map<String, dynamic> json) => _$BookmarkNovelFromJson(json);
}
