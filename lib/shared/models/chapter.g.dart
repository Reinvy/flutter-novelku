// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chapter _$ChapterFromJson(Map<String, dynamic> json) => _Chapter(
  id: json['id'] as String,
  novelId: json['novelId'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  order: (json['order'] as num).toInt(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  novel: json['novel'] == null
      ? null
      : ChapterNovel.fromJson(json['novel'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChapterToJson(_Chapter instance) => <String, dynamic>{
  'id': instance.id,
  'novelId': instance.novelId,
  'title': instance.title,
  'content': instance.content,
  'order': instance.order,
  'createdAt': instance.createdAt?.toIso8601String(),
  'novel': instance.novel,
};

_ChapterNovel _$ChapterNovelFromJson(Map<String, dynamic> json) =>
    _ChapterNovel(
      id: json['id'] as String,
      title: json['title'] as String,
      coverUrl: json['coverUrl'] as String?,
      authorId: json['authorId'] as String?,
    );

Map<String, dynamic> _$ChapterNovelToJson(_ChapterNovel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'coverUrl': instance.coverUrl,
      'authorId': instance.authorId,
    };
