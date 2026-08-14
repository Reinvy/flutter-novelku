import 'package:flutter/material.dart';

/// Palet warna NovelKu — hangat, editorial, nyaman dibaca.
abstract final class AppColors {
  // Light
  static const Color background = Color(0xFFFAF7F2); // kertas hangat
  static const Color surface = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF0F766E); // deep teal
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFCCFBF1);
  static const Color onPrimaryContainer = Color(0xFF042F2E);
  static const Color accent = Color(0xFFB45309); // amber
  static const Color text = Color(0xFF1C1917); // ink
  static const Color textMuted = Color(0xFF78716C);
  static const Color error = Color(0xFFB91C1C);
  static const Color divider = Color(0xFFE7E5E4);

  // Dark
  static const Color backgroundDark = Color(0xFF171412);
  static const Color surfaceDark = Color(0xFF221E1B);
  static const Color primaryDark = Color(0xFF2DD4BF);
  static const Color onPrimaryDark = Color(0xFF0B2A27);
  static const Color primaryContainerDark = Color(0xFF134E4A);
  static const Color onPrimaryContainerDark = Color(0xFFCCFBF1);
  static const Color accentDark = Color(0xFFF59E0B);
  static const Color textDark = Color(0xFFF5F5F4);
  static const Color textMutedDark = Color(0xFFA8A29E);
  static const Color errorDark = Color(0xFFF87171);
  static const Color dividerDark = Color(0xFF3A3531);

  // Reader modes
  static const Color sepiaBackground = Color(0xFFF5ECD9);
  static const Color sepiaText = Color(0xFF3D2E1D);

  static const List<Color> coverGradient = [Color(0x33000000), Color(0x99000000)];
}
