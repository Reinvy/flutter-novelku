import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/novel.dart';
import '../data/user_data_repository.dart';

part 'library_controller.g.dart';

/// Daftar novel di perpustakaan user.
@riverpod
class LibraryController extends _$LibraryController {
  @override
  Future<List<Novel>> build() async {
    final repo = ref.read(userDataRepositoryProvider);
    final raw = await repo.getLibrary();
    return raw.map((e) => Novel.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> removeFromLibrary(String novelId) async {
    final repo = ref.read(userDataRepositoryProvider);
    await repo.removeFromLibrary(novelId);
    ref.invalidateSelf();
    await future;
  }
}
