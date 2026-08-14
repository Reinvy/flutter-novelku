// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Bookmark _$BookmarkFromJson(Map<String, dynamic> json) => _Bookmark(
  id: json['id'] as String,
  title: json['title'] as String,
  order: (json['order'] as num).toInt(),
  bookmarkedAt: DateTime.parse(json['bookmarkedAt'] as String),
  novel: BookmarkNovel.fromJson(json['novel'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookmarkToJson(_Bookmark instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'order': instance.order,
  'bookmarkedAt': instance.bookmarkedAt.toIso8601String(),
  'novel': instance.novel,
};

_BookmarkNovel _$BookmarkNovelFromJson(Map<String, dynamic> json) =>
    _BookmarkNovel(
      id: json['id'] as String,
      title: json['title'] as String,
      coverUrl: json['coverUrl'] as String?,
    );

Map<String, dynamic> _$BookmarkNovelToJson(_BookmarkNovel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'coverUrl': instance.coverUrl,
    };
