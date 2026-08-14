import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Tipografi global: Plus Jakarta Sans untuk UI, Lora (serif) untuk konten baca.
abstract final class AppTypography {
  static final TextTheme _base = GoogleFonts.plusJakartaSansTextTheme();

  static TextTheme light() => _base.copyWith(
        displayLarge: _base.displayLarge?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -1),
        displayMedium: _base.displayMedium?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -0.5),
        headlineLarge: _base.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
        headlineMedium: _base.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
        titleLarge: _base.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        titleMedium: _base.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        bodyLarge: _base.bodyLarge?.copyWith(height: 1.5),
        bodyMedium: _base.bodyMedium?.copyWith(height: 1.5),
      );

  static TextTheme dark() => light().apply(
        bodyColor: AppColors.textDark,
        displayColor: AppColors.textDark,
      );

  /// Font serif untuk isi novel (reader).
  static TextStyle reader(double size, Color color) => GoogleFonts.lora(
        fontSize: size,
        height: 1.7,
        color: color,
        fontWeight: FontWeight.w400,
      );
}
