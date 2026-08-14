// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novel_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChapterSummary _$ChapterSummaryFromJson(Map<String, dynamic> json) =>
    _ChapterSummary(
      id: json['id'] as String,
      title: json['title'] as String,
      order: (json['order'] as num).toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ChapterSummaryToJson(_ChapterSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'order': instance.order,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_NovelDetail _$NovelDetailFromJson(Map<String, dynamic> json) => _NovelDetail(
  id: json['id'] as String,
  title: json['title'] as String,
  synopsis: json['synopsis'] as String,
  status: json['status'] as String,
  coverUrl: json['coverUrl'] as String?,
  authorId: json['authorId'] as String,
  authorName: json['authorName'] as String,
  authorAvatarUrl: json['authorAvatarUrl'] as String?,
  chapterCount: (json['chapterCount'] as num).toInt(),
  ratingCount: (json['ratingCount'] as num).toInt(),
  averageRating: (json['averageRating'] as num?)?.toDouble(),
  chapters: (json['chapters'] as List<dynamic>)
      .map((e) => ChapterSummary.fromJson(e as Map<String, dynamic>))
      .toList(),
  myRating: (json['myRating'] as num?)?.toInt(),
  inLibrary: json['inLibrary'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$NovelDetailToJson(_NovelDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'synopsis': instance.synopsis,
      'status': instance.status,
      'coverUrl': instance.coverUrl,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'authorAvatarUrl': instance.authorAvatarUrl,
      'chapterCount': instance.chapterCount,
      'ratingCount': instance.ratingCount,
      'averageRating': instance.averageRating,
      'chapters': instance.chapters,
      'myRating': instance.myRating,
      'inLibrary': instance.inLibrary,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
