import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/theme/app_colors.dart';

/// Mode baca reader.
enum ReaderMode { light, sepia, dark }

extension ReaderModeX on ReaderMode {
  Color get background => switch (this) {
        ReaderMode.light => AppColors.background,
        ReaderMode.sepia => AppColors.sepiaBackground,
        ReaderMode.dark => AppColors.backgroundDark,
      };

  Color get textColor => switch (this) {
        ReaderMode.light => AppColors.text,
        ReaderMode.sepia => AppColors.sepiaText,
        ReaderMode.dark => AppColors.textDark,
      };

  bool get isDark => this == ReaderMode.dark;
}

/// Gaya navigasi membaca novel.
enum ReadingStyle {
  spatialPageTurn,
  continuousScroll,
}

/// Penyimpanan preferensi ringan (font size, mode baca, spatial settings).
class SettingsStorage {
  static const _fontSizeKey = 'reader_font_size';
  static const _readerModeKey = 'reader_mode';
  static const _themeModeKey = 'theme_mode';
  static const _powerSaverKey = 'power_saver_mode';
  static const _readingStyleKey = 'reading_style';
  static const _gyroEnabledKey = 'gyro_parallax_enabled';
  static const _ambientGlowKey = 'ambient_glow_enabled';
  static const _genreOverrideKey = 'genre_theme_override';

  Future<double> readReaderFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_fontSizeKey) ?? 18;
  }

  Future<void> writeReaderFontSize(double size) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_fontSizeKey, size);
  }

  Future<ReaderMode> readReaderMode() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_readerModeKey);
    return ReaderMode.values.firstWhere(
      (m) => m.name == name,
      orElse: () => ReaderMode.light,
    );
  }

  Future<void> writeReaderMode(ReaderMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_readerModeKey, mode.name);
  }

  Future<ThemeMode> readThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_themeModeKey);
    return ThemeMode.values.firstWhere(
      (m) => m.name == name,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> writeThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, mode.name);
  }

  Future<bool> readPowerSaverMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_powerSaverKey) ?? false;
  }

  Future<void> writePowerSaverMode(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_powerSaverKey, enabled);
  }

  Future<ReadingStyle> readReadingStyle() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_readingStyleKey);
    return ReadingStyle.values.firstWhere(
      (s) => s.name == name,
      orElse: () => ReadingStyle.spatialPageTurn,
    );
  }

  Future<void> writeReadingStyle(ReadingStyle style) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_readingStyleKey, style.name);
  }

  Future<bool> readGyroParallaxEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_gyroEnabledKey) ?? true;
  }

  Future<void> writeGyroParallaxEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_gyroEnabledKey, enabled);
  }

  Future<bool> readAmbientGlowEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_ambientGlowKey) ?? true;
  }

  Future<void> writeAmbientGlowEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_ambientGlowKey, enabled);
  }

  Future<String?> readGenreOverride() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_genreOverrideKey);
  }

  Future<void> writeGenreOverride(String? genre) async {
    final prefs = await SharedPreferences.getInstance();
    if (genre == null) {
      await prefs.remove(_genreOverrideKey);
    } else {
      await prefs.setString(_genreOverrideKey, genre);
    }
  }
}

final settingsStorageProvider = Provider<SettingsStorage>(
  (ref) => SettingsStorage(),
);
