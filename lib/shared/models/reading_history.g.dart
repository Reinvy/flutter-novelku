// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReadingHistory _$ReadingHistoryFromJson(Map<String, dynamic> json) =>
    _ReadingHistory(
      novel: HistoryNovel.fromJson(json['novel'] as Map<String, dynamic>),
      chapter: HistoryChapter.fromJson(json['chapter'] as Map<String, dynamic>),
      progress: (json['progress'] as num).toInt(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ReadingHistoryToJson(_ReadingHistory instance) =>
    <String, dynamic>{
      'novel': instance.novel,
      'chapter': instance.chapter,
      'progress': instance.progress,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_HistoryNovel _$HistoryNovelFromJson(Map<String, dynamic> json) =>
    _HistoryNovel(
      id: json['id'] as String,
      title: json['title'] as String,
      coverUrl: json['coverUrl'] as String?,
      author: json['author'] == null
          ? null
          : HistoryAuthor.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoryNovelToJson(_HistoryNovel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'coverUrl': instance.coverUrl,
      'author': instance.author,
    };

_HistoryAuthor _$HistoryAuthorFromJson(Map<String, dynamic> json) =>
    _HistoryAuthor(name: json['name'] as String);

Map<String, dynamic> _$HistoryAuthorToJson(_HistoryAuthor instance) =>
    <String, dynamic>{'name': instance.name};

_HistoryChapter _$HistoryChapterFromJson(Map<String, dynamic> json) =>
    _HistoryChapter(
      id: json['id'] as String,
      title: json['title'] as String,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$HistoryChapterToJson(_HistoryChapter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'order': instance.order,
    };
