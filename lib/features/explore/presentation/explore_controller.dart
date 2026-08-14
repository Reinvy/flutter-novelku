import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/novel.dart';
import '../data/novel_repository.dart';

part 'explore_controller.freezed.dart';
part 'explore_controller.g.dart';

@freezed
abstract class ExploreFilter with _$ExploreFilter {
  const factory ExploreFilter({
    @Default('') String search,
    String? status,
    @Default('newest') String sort,
  }) = _ExploreFilter;

  const ExploreFilter._();

  factory ExploreFilter.initial() => const ExploreFilter();
}

@riverpod
class ExploreController extends _$ExploreController {
  ExploreFilter _filter = ExploreFilter.initial();
  final List<Novel> _items = [];
  bool _hasMore = true;
  int _page = 1;

  @override
  Future<List<Novel>> build() async {
    _items.clear();
    _page = 1;
    _hasMore = true;
    return _fetch();
  }

  Future<List<Novel>> _fetch() async {
    final repo = ref.read(novelRepositoryProvider);
    final result = await repo.listNovels(
      search: _filter.search,
      status: _filter.status,
      sort: _filter.sort,
      page: _page,
      pageSize: 10,
    );
    _items.addAll(result.items);
    _hasMore = _page < result.meta.totalPages;
    return List.of(_items);
  }

  Future<void> search(String query) async {
    _filter = _filter.copyWith(search: query.trim());
    ref.invalidateSelf();
    await future;
  }

  Future<void> setStatus(String? status) async {
    _filter = _filter.copyWith(status: status);
    ref.invalidateSelf();
    await future;
  }

  Future<void> setSort(String sort) async {
    _filter = _filter.copyWith(sort: sort);
    ref.invalidateSelf();
    await future;
  }

  Future<void> loadMore() async {
    if (!_hasMore || state.isLoading) return;
    _page++;
    try {
      final updated = await _fetch();
      state = AsyncData(updated);
    } catch (e, st) {
      _page--;
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
