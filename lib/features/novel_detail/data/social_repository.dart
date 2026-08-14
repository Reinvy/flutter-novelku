import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../../../shared/models/comment.dart';
import '../../../shared/models/paged_response.dart';
import '../../../shared/models/rating_info.dart';

/// Repository fitur sosial: rating & komentar.
class SocialRepository {
  SocialRepository(this._client);

  final ApiClient _client;

  Future<RatingInfo> getRating(String novelId) async {
    final response = await _client.dio.get<Map<String, dynamic>>('/novels/$novelId/rating');
    return RatingInfo.fromJson(response.data!);
  }

  Future<void> setRating(String novelId, int score) async {
    await _client.dio.put<Map<String, dynamic>>(
      '/novels/$novelId/rating',
      data: {'score': score},
    );
  }

  Future<void> deleteRating(String novelId) async {
    await _client.dio.delete('/novels/$novelId/rating');
  }

  Future<PagedResponse<Comment>> listComments(String novelId, {int page = 1, int pageSize = 10}) async {
    final response = await _client.dio.get<Map<String, dynamic>>(
      '/novels/$novelId/comments',
      queryParameters: {'page': page, 'pageSize': pageSize},
    );
    return PagedResponse<Comment>.fromJson(
      response.data!,
      (json) => Comment.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<Comment> addComment(String novelId, String content) async {
    final response = await _client.dio.post<Map<String, dynamic>>(
      '/novels/$novelId/comments',
      data: {'content': content},
    );
    return Comment.fromJson(response.data!['comment'] as Map<String, dynamic>);
  }

  Future<void> deleteComment(String commentId) async {
    await _client.dio.delete('/comments/$commentId');
  }
}

final socialRepositoryProvider = Provider<SocialRepository>(
  (ref) => SocialRepository(ref.watch(apiClientProvider)),
);
