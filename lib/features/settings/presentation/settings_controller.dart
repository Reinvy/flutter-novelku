import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/storage/settings_storage.dart';

part 'settings_controller.g.dart';

/// Preferensi tema global (light/dark/system), dipersist.
@riverpod
class ThemeModeController extends _$ThemeModeController {
  @override
  Future<ThemeMode> build() async {
    return ref.watch(settingsStorageProvider).readThemeMode();
  }

  Future<void> set(ThemeMode mode) async {
    await ref.read(settingsStorageProvider).writeThemeMode(mode);
    ref.invalidateSelf();
  }
}
