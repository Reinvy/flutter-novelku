import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
abstract class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String content,
    required DateTime createdAt,
    required CommentUser user,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}

@freezed
abstract class CommentUser with _$CommentUser {
  const factory CommentUser({
    required String id,
    required String name,
    String? avatarUrl,
  }) = _CommentUser;

  factory CommentUser.fromJson(Map<String, dynamic> json) => _$CommentUserFromJson(json);
}
