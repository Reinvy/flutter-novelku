import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/novel.dart';
import '../data/publisher_repository.dart';

part 'publisher_controller.g.dart';

/// Novel karya user (penulis).
@riverpod
class MyNovelsController extends _$MyNovelsController {
  @override
  Future<List<Novel>> build() async {
    final result = await ref.read(publisherRepositoryProvider).getMyNovels();
    return result.items;
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> deleteNovel(String novelId) async {
    await ref.read(publisherRepositoryProvider).deleteNovel(novelId);
    ref.invalidateSelf();
    await future;
  }
}
