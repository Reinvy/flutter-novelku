import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../../../shared/models/chapter.dart';
import '../../../shared/models/novel.dart';
import '../../../shared/models/novel_detail.dart';
import '../../../shared/models/paged_response.dart';

/// Repository data novel: jelajah, detail, bab.
class NovelRepository {
  NovelRepository(this._client);

  final ApiClient _client;

  Future<PagedResponse<Novel>> listNovels({
    String? search,
    String? status,
    String? authorId,
    String sort = 'newest',
    int page = 1,
    int pageSize = 10,
  }) async {
    final response = await _client.dio.get<Map<String, dynamic>>(
      '/novels',
      queryParameters: {
        if (search != null && search.isNotEmpty) 'search': search,
        if (status != null) 'status': status,
        if (authorId != null) 'authorId': authorId,
        'sort': sort,
        'page': page,
        'pageSize': pageSize,
      },
    );
    return PagedResponse<Novel>.fromJson(
      response.data!,
      (json) => Novel.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<NovelDetail> getNovelDetail(String novelId) async {
    final response = await _client.dio.get<Map<String, dynamic>>('/novels/$novelId');
    return NovelDetail.fromJson(response.data!['novel'] as Map<String, dynamic>);
  }

  Future<List<ChapterSummary>> listChapters(String novelId) async {
    final response = await _client.dio.get<Map<String, dynamic>>('/novels/$novelId/chapters');
    final list = response.data!['chapters'] as List<dynamic>;
    return list
        .map((e) => ChapterSummary.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Chapter> getChapter(String chapterId) async {
    final response = await _client.dio.get<Map<String, dynamic>>('/chapters/$chapterId');
    return Chapter.fromJson(response.data!['chapter'] as Map<String, dynamic>);
  }

  Future<void> addToLibrary(String novelId) async {
    await _client.dio.post('/me/library/$novelId');
  }

  Future<void> removeFromLibrary(String novelId) async {
    await _client.dio.delete('/me/library/$novelId');
  }
}

final novelRepositoryProvider = Provider<NovelRepository>(
  (ref) => NovelRepository(ref.watch(apiClientProvider)),
);
