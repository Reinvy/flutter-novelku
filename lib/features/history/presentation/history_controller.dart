import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/reading_history.dart';
import '../../library/data/user_data_repository.dart';

part 'history_controller.g.dart';

/// Riwayat baca user.
@riverpod
class HistoryController extends _$HistoryController {
  @override
  Future<List<ReadingHistory>> build() async {
    return ref.read(userDataRepositoryProvider).getHistory();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
