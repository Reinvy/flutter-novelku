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

/// Penyimpanan preferensi ringan (font size, mode baca).
class SettingsStorage {
  static const _fontSizeKey = 'reader_font_size';
  static const _readerModeKey = 'reader_mode';
  static const _themeModeKey = 'theme_mode';

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
}

final settingsStorageProvider = Provider<SettingsStorage>(
  (ref) => SettingsStorage(),
);
