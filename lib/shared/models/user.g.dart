// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  bio: json['bio'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  coverUrl: json['coverUrl'] as String?,
  role: json['role'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'name': instance.name,
  'bio': instance.bio,
  'avatarUrl': instance.avatarUrl,
  'coverUrl': instance.coverUrl,
  'role': instance.role,
  'createdAt': instance.createdAt?.toIso8601String(),
};
