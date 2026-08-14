import 'package:flutter/material.dart';
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

/// Kontrol Mode Hemat Daya / Classic Mode (menonaktifkan partikel & shader spasial)
@riverpod
class PowerSaverController extends _$PowerSaverController {
  @override
  Future<bool> build() async {
    return ref.watch(settingsStorageProvider).readPowerSaverMode();
  }

  Future<void> toggle() async {
    final current = state.value ?? false;
    await ref.read(settingsStorageProvider).writePowerSaverMode(!current);
    ref.invalidateSelf();
  }

  Future<void> set(bool enabled) async {
    await ref.read(settingsStorageProvider).writePowerSaverMode(enabled);
    ref.invalidateSelf();
  }
}

/// Kontrol Gaya Membaca (Spatial 3D Page Turn vs Classic Continuous Scroll)
@riverpod
class ReadingStyleController extends _$ReadingStyleController {
  @override
  Future<ReadingStyle> build() async {
    return ref.watch(settingsStorageProvider).readReadingStyle();
  }

  Future<void> set(ReadingStyle style) async {
    await ref.read(settingsStorageProvider).writeReadingStyle(style);
    ref.invalidateSelf();
  }
}

/// Kontrol Efek Parallax Giroskop
@riverpod
class GyroParallaxController extends _$GyroParallaxController {
  @override
  Future<bool> build() async {
    return ref.watch(settingsStorageProvider).readGyroParallaxEnabled();
  }

  Future<void> set(bool enabled) async {
    await ref.read(settingsStorageProvider).writeGyroParallaxEnabled(enabled);
    ref.invalidateSelf();
  }
}

/// Kontrol Efek Ambient Lighting Dinamis
@riverpod
class AmbientGlowController extends _$AmbientGlowController {
  @override
  Future<bool> build() async {
    return ref.watch(settingsStorageProvider).readAmbientGlowEnabled();
  }

  Future<void> set(bool enabled) async {
    await ref.read(settingsStorageProvider).writeAmbientGlowEnabled(enabled);
    ref.invalidateSelf();
  }
}

/// Kontrol Override Tema Genre
@riverpod
class GenreOverrideController extends _$GenreOverrideController {
  @override
  Future<String?> build() async {
    return ref.watch(settingsStorageProvider).readGenreOverride();
  }

  Future<void> set(String? genre) async {
    await ref.read(settingsStorageProvider).writeGenreOverride(genre);
    ref.invalidateSelf();
  }
}
