import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../../../shared/models/novel.dart';
import '../../../shared/models/novel_detail.dart';
import '../../../shared/models/paged_response.dart';
import '../../../shared/models/chapter.dart';

/// Repository untuk penulis: kelola novel & bab.
class PublisherRepository {
  PublisherRepository(this._client);

  final ApiClient _client;

  Future<PagedResponse<Novel>> getMyNovels({int page = 1, int pageSize = 50}) async {
    final response = await _client.dio.get<Map<String, dynamic>>(
      '/novels',
      queryParameters: {'page': page, 'pageSize': pageSize},
    );
    return PagedResponse<Novel>.fromJson(
      response.data!,
      (json) => Novel.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<NovelDetail> getMyNovelDetail(String novelId) async {
    final response = await _client.dio.get<Map<String, dynamic>>('/novels/$novelId');
    return NovelDetail.fromJson(response.data!['novel'] as Map<String, dynamic>);
  }

  Future<Novel> createNovel({
    required String title,
    required String synopsis,
    required String status,
    String? coverUrl,
  }) async {
    final response = await _client.dio.post<Map<String, dynamic>>(
      '/novels',
      data: {
        'title': title,
        'synopsis': synopsis,
        'status': status,
        if (coverUrl != null) 'coverUrl': coverUrl,
      },
    );
    return Novel.fromJson(response.data!['novel'] as Map<String, dynamic>);
  }

  Future<void> deleteNovel(String novelId) async {
    await _client.dio.delete('/novels/$novelId');
  }

  Future<Chapter> createChapter({
    required String novelId,
    required String title,
    required String content,
  }) async {
    final response = await _client.dio.post<Map<String, dynamic>>(
      '/novels/$novelId/chapters',
      data: {'title': title, 'content': content},
    );
    return Chapter.fromJson(response.data!['chapter'] as Map<String, dynamic>);
  }

  Future<void> deleteChapter(String chapterId) async {
    await _client.dio.delete('/chapters/$chapterId');
  }
}

final publisherRepositoryProvider = Provider<PublisherRepository>(
  (ref) => PublisherRepository(ref.watch(apiClientProvider)),
);
