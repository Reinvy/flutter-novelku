// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Novel _$NovelFromJson(Map<String, dynamic> json) => _Novel(
  id: json['id'] as String,
  title: json['title'] as String,
  synopsis: json['synopsis'] as String,
  status: json['status'] as String,
  coverUrl: json['coverUrl'] as String?,
  author: Author.fromJson(json['author'] as Map<String, dynamic>),
  chapterCount: (json['chapterCount'] as num).toInt(),
  ratingCount: (json['ratingCount'] as num).toInt(),
  averageRating: (json['averageRating'] as num?)?.toDouble(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$NovelToJson(_Novel instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'synopsis': instance.synopsis,
  'status': instance.status,
  'coverUrl': instance.coverUrl,
  'author': instance.author,
  'chapterCount': instance.chapterCount,
  'ratingCount': instance.ratingCount,
  'averageRating': instance.averageRating,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
