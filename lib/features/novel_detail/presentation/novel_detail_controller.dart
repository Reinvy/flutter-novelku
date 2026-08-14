import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/comment.dart';
import '../../../shared/models/novel_detail.dart';
import '../../../shared/models/rating_info.dart';
import '../data/social_repository.dart';
import '../../explore/data/novel_repository.dart';

part 'novel_detail_controller.g.dart';

/// Detail novel + rating + komentar.
@riverpod
class NovelDetailController extends _$NovelDetailController {
  @override
  Future<NovelDetail> build(String novelId) async {
    return ref.read(novelRepositoryProvider).getNovelDetail(novelId);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> toggleLibrary() async {
    final repo = ref.read(novelRepositoryProvider);
    final novel = state.value;
    if (novel == null) return;

    final currentlyInLibrary = novel.inLibrary ?? false;
    if (currentlyInLibrary) {
      await repo.removeFromLibrary(novel.id);
    } else {
      await repo.addToLibrary(novel.id);
    }
    await refresh();
  }
}

/// Rating user saat ini + aggregate.
@riverpod
class RatingController extends _$RatingController {
  @override
  Future<RatingInfo> build(String novelId) async {
    return ref.read(socialRepositoryProvider).getRating(novelId);
  }

  Future<void> rate(int score) async {
    await ref.read(socialRepositoryProvider).setRating(novelId, score);
    ref.invalidateSelf();
    await future;
    ref.invalidate(novelDetailControllerProvider(novelId));
  }

  Future<void> clearRating() async {
    await ref.read(socialRepositoryProvider).deleteRating(novelId);
    ref.invalidateSelf();
    await future;
    ref.invalidate(novelDetailControllerProvider(novelId));
  }
}

/// Komentar novel (paginasi).
@riverpod
class CommentsController extends _$CommentsController {
  int _page = 1;
  final List<Comment> _items = [];
  bool _hasMore = true;

  @override
  Future<List<Comment>> build(String novelId) async {
    _items.clear();
    _page = 1;
    _hasMore = true;
    final result = await ref.read(socialRepositoryProvider).listComments(novelId, page: 1, pageSize: 10);
    _items.addAll(result.items);
    _hasMore = _page < result.meta.totalPages;
    return List.of(_items);
  }

  Future<void> loadMore() async {
    if (!_hasMore || state.isLoading) return;
    _page++;
    try {
      final result = await ref.read(socialRepositoryProvider).listComments(novelId, page: _page, pageSize: 10);
      _items.addAll(result.items);
      _hasMore = _page < result.meta.totalPages;
      state = AsyncData(List.of(_items));
    } catch (e, st) {
      _page--;
      state = AsyncError(e, st);
    }
  }

  Future<void> add(String content) async {
    await ref.read(socialRepositoryProvider).addComment(novelId, content);
    ref.invalidateSelf();
    await future;
  }

  Future<void> remove(String commentId) async {
    await ref.read(socialRepositoryProvider).deleteComment(commentId);
    ref.invalidateSelf();
    await future;
  }
}
