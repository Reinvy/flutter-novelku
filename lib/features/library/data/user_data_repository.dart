import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../../../shared/models/bookmark.dart';
import '../../../shared/models/reading_history.dart';

/// Repository data personal user: library, history, bookmark.
class UserDataRepository {
  UserDataRepository(this._client);

  final ApiClient _client;

  // ---- Library ----
  Future<List<dynamic>> getLibrary() async {
    final response = await _client.dio.get<Map<String, dynamic>>('/me/library');
    return response.data!['novels'] as List<dynamic>;
  }

  Future<void> removeFromLibrary(String novelId) async {
    await _client.dio.delete('/me/library/$novelId');
  }

  // ---- History ----
  Future<List<ReadingHistory>> getHistory() async {
    final response = await _client.dio.get<Map<String, dynamic>>('/me/history');
    final list = response.data!['history'] as List<dynamic>;
    return list.map((e) => ReadingHistory.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<void> updateHistory({
    required String novelId,
    required String chapterId,
    required int progress,
  }) async {
    await _client.dio.put<Map<String, dynamic>>(
      '/me/history/$novelId',
      data: {'chapterId': chapterId, 'progress': progress},
    );
  }

  // ---- Bookmarks ----
  Future<List<Bookmark>> getBookmarks() async {
    final response = await _client.dio.get<Map<String, dynamic>>('/me/bookmarks');
    final list = response.data!['bookmarks'] as List<dynamic>;
    return list.map((e) => Bookmark.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<void> addBookmark(String chapterId) async {
    await _client.dio.post('/me/bookmarks/$chapterId');
  }

  Future<void> removeBookmark(String chapterId) async {
    await _client.dio.delete('/me/bookmarks/$chapterId');
  }
}

final userDataRepositoryProvider = Provider<UserDataRepository>(
  (ref) => UserDataRepository(ref.watch(apiClientProvider)),
);
