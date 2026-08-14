import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/bookmark.dart';
import '../../library/data/user_data_repository.dart';

part 'bookmarks_controller.g.dart';

/// Daftar bookmark bab user.
@riverpod
class BookmarksController extends _$BookmarksController {
  @override
  Future<List<Bookmark>> build() async {
    return ref.read(userDataRepositoryProvider).getBookmarks();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> remove(String chapterId) async {
    await ref.read(userDataRepositoryProvider).removeBookmark(chapterId);
    ref.invalidateSelf();
    await future;
  }
}
