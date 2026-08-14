import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Jenis tema genre untuk atmosfer latar belakang Story Room.
enum GenreAtmosphereType {
  fantasy,
  sciFi,
  romance,
  mystery,
  classic,
}

/// Definisi elevasi spasial (kedalaman sumbu Z).
abstract final class SpatialElevations {
  static const double z0Canvas = 0.0;
  static const double z1Atmosphere = 10.0;
  static const double z2CardResting = 20.0;
  static const double z3CardActive = 40.0;
  static const double z4PortalModal = 80.0;
  static const double z5Ribbon = 100.0;
}

/// Kurva animasi spasial berkarakter fisika pegas (spring physics) & portal.
abstract final class SpatialCurves {
  /// Kurva pegas elastis cepat untuk kartu ditekan
  static const Curve springOut = Cubic(0.175, 0.885, 0.32, 1.275);

  /// Kurva ekspansi halus untuk portal dimensi
  static const Curve portalZoom = Cubic(0.22, 1.0, 0.36, 1.0);

  /// Kurva lengkungan pembalikan halaman 3D
  static const Curve pageCurl = Cubic(0.25, 0.1, 0.25, 1.0);

  /// Kurva kemunculan pendaran ambient
  static const Curve ambientCrossfade = Curves.easeInOutCubic;
}

/// Profil getaran haptik untuk interaksi spasial.
abstract final class SpatialHaptics {
  /// Sentuhan kartu 3D
  static void cardPress() {
    HapticFeedback.selectionClick();
  }

  /// Memasuki portal ruang baca
  static void portalEngage() {
    HapticFeedback.mediumImpact();
  }

  /// Pembalikan halaman 3D terkunci
  static void pageSnap() {
    HapticFeedback.lightImpact();
  }

  /// Pita bookmark tertarik dan terjangkar
  static void ribbonAnchor() {
    HapticFeedback.heavyImpact();
  }
}

/// Konfigurasi visual atmosfer genre.
class GenreVisualConfig {
  const GenreVisualConfig({
    required this.type,
    required this.name,
    required this.baseColor,
    required this.accentGlow,
    required this.secondaryGlow,
    required this.ambientBase,
    required this.ambientTextColor,
  });

  final GenreAtmosphereType type;
  final String name;
  final Color baseColor;
  final Color accentGlow;
  final Color secondaryGlow;
  final Color ambientBase;
  final Color ambientTextColor;

  static const fantasy = GenreVisualConfig(
    type: GenreAtmosphereType.fantasy,
    name: 'Fantasi',
    baseColor: Color(0xFF1E1712),
    accentGlow: Color(0xFFD97706), // amber gold
    secondaryGlow: Color(0xFF92400E),
    ambientBase: Color(0xFFFAF2E4), // aged paper
    ambientTextColor: Color(0xFF2C2219),
  );

  static const sciFi = GenreVisualConfig(
    type: GenreAtmosphereType.sciFi,
    name: 'Sci-Fi',
    baseColor: Color(0xFF090D16),
    accentGlow: Color(0xFF06B6D4), // cyan neon
    secondaryGlow: Color(0xFF6366F1), // indigo neon
    ambientBase: Color(0xFF0A0F1D), // dark obsidian
    ambientTextColor: Color(0xFFE2E8F0),
  );

  static const romance = GenreVisualConfig(
    type: GenreAtmosphereType.romance,
    name: 'Romantis',
    baseColor: Color(0xFF1F1218),
    accentGlow: Color(0xFFF43F5E), // rose
    secondaryGlow: Color(0xFFFB7185),
    ambientBase: Color(0xFFFFF1F2), // soft cream pink
    ambientTextColor: Color(0xFF4C0519),
  );

  static const mystery = GenreVisualConfig(
    type: GenreAtmosphereType.mystery,
    name: 'Misteri',
    baseColor: Color(0xFF111116),
    accentGlow: Color(0xFF8B5CF6), // violet mystic
    secondaryGlow: Color(0xFF3B82F6),
    ambientBase: Color(0xFF14131C), // deep midnight
    ambientTextColor: Color(0xFFEDE9FE),
  );

  static const classic = GenreVisualConfig(
    type: GenreAtmosphereType.classic,
    name: 'Klasik',
    baseColor: Color(0xFF18181B),
    accentGlow: Color(0xFF0F766E), // teal
    secondaryGlow: Color(0xFF14B8A6),
    ambientBase: Color(0xFFFBF9F5),
    ambientTextColor: Color(0xFF18181B),
  );

  static GenreVisualConfig fromGenreString(String? genre) {
    if (genre == null) return classic;
    final lower = genre.toLowerCase();
    if (lower.contains('fantas') || lower.contains('sihir') || lower.contains('magic') || lower.contains('isekai')) {
      return fantasy;
    }
    if (lower.contains('sci') || lower.contains('cyber') || lower.contains('space') || lower.contains('robot') || lower.contains('futur')) {
      return sciFi;
    }
    if (lower.contains('roman') || lower.contains('cinta') || lower.contains('love') || lower.contains('drama')) {
      return romance;
    }
    if (lower.contains('mister') || lower.contains('thrill') || lower.contains('horror') || lower.contains('detektif')) {
      return mystery;
    }
    return classic;
  }
}

/// Mood nada paragraf untuk pencahayaan ambient adaptif.
enum ContentMood {
  neutral,
  intimateWarm, // hangat, damai, cinta
  suspenseDark, // tegang, misteri, bahaya
  actionHigh,   // aksi, seru, ledakan
  wonderMystic, // takjub, sihir, megah
}

class MoodLightingProfile {
  const MoodLightingProfile({
    required this.mood,
    required this.glowColor,
    required this.edgeIntensity,
  });

  final ContentMood mood;
  final Color glowColor;
  final double edgeIntensity;

  static const Map<ContentMood, MoodLightingProfile> profiles = {
    ContentMood.neutral: MoodLightingProfile(
      mood: ContentMood.neutral,
      glowColor: Color(0x1A0F766E),
      edgeIntensity: 0.15,
    ),
    ContentMood.intimateWarm: MoodLightingProfile(
      mood: ContentMood.intimateWarm,
      glowColor: Color(0x38F59E0B), // warm amber gold
      edgeIntensity: 0.35,
    ),
    ContentMood.suspenseDark: MoodLightingProfile(
      mood: ContentMood.suspenseDark,
      glowColor: Color(0x3D1E3A8A), // deep navy / indigo
      edgeIntensity: 0.38,
    ),
    ContentMood.actionHigh: MoodLightingProfile(
      mood: ContentMood.actionHigh,
      glowColor: Color(0x3BE11D48), // crimson flame
      edgeIntensity: 0.40,
    ),
    ContentMood.wonderMystic: MoodLightingProfile(
      mood: ContentMood.wonderMystic,
      glowColor: Color(0x387C3AED), // royal amethyst
      edgeIntensity: 0.35,
    ),
  };
}
