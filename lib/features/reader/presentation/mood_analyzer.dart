import '../../../core/theme/spatial_tokens.dart';

/// Penganalisis suasana hati (mood) berbasis teks konten novel.
/// Mendeteksi kata kunci emosional dalam bahasa Indonesia & Inggris.
abstract final class MoodAnalyzer {
  static const _warmKeywords = {
    'cinta', 'sayang', 'peluk', 'hangat', 'senyum', 'lembut', 'damai',
    'bahagia', 'mata', 'tatap', 'bisik', 'kasih', 'manis', 'rindu',
    'jantung', 'hati', 'genggam', 'bibir', 'kecup', 'merona', 'mesra',
    'love', 'hug', 'warm', 'smile', 'gentle', 'peace', 'sweet', 'heart',
  };

  static const _darkKeywords = {
    'gelap', 'takut', 'bayangan', 'misteri', 'dingin', 'sunyi', 'gemetar',
    'ancaman', 'darah', 'mati', 'mayat', 'kuburan', 'jerit', 'racun',
    'kengerian', 'kelam', 'hantu', 'kutukan', 'kebencian', 'curiga',
    'dark', 'fear', 'shadow', 'mystery', 'cold', 'blood', 'death', 'horror',
  };

  static const _actionKeywords = {
    'hancur', 'ledakan', 'lari', 'pedang', 'serang', 'teriak', 'kilat',
    'api', 'bertarung', 'perang', 'pukul', 'tendang', 'tembak', 'lompat',
    'benturan', 'senjata', 'panah', 'membelah', 'terbakar', 'musuh',
    'strike', 'battle', 'blast', 'explosion', 'fire', 'fight', 'sword', 'attack',
  };

  static const _wonderKeywords = {
    'sihir', 'mantra', 'cahaya', 'langit', 'dewa', 'portal', 'kristal',
    'kosmik', 'naga', 'keajaiban', 'berkilau', 'energi', 'bintang', 'abadi',
    'dimensi', 'legenda', 'pesona', 'takjub', 'megah', 'aura',
    'magic', 'spell', 'realm', 'divine', 'ethereal', 'stars', 'wonder', 'crystal',
  };

  /// Menganalisis potongan teks dan mengembalikan ContentMood dominan.
  static ContentMood analyzeText(String text) {
    if (text.isEmpty) return ContentMood.neutral;

    final lower = text.toLowerCase();
    int warmScore = 0;
    int darkScore = 0;
    int actionScore = 0;
    int wonderScore = 0;

    for (final word in _warmKeywords) {
      if (lower.contains(word)) warmScore++;
    }
    for (final word in _darkKeywords) {
      if (lower.contains(word)) darkScore++;
    }
    for (final word in _actionKeywords) {
      if (lower.contains(word)) actionScore++;
    }
    for (final word in _wonderKeywords) {
      if (lower.contains(word)) wonderScore++;
    }

    final maxScore = [warmScore, darkScore, actionScore, wonderScore].reduce((a, b) => a > b ? a : b);
    if (maxScore < 2) return ContentMood.neutral;

    if (maxScore == actionScore) return ContentMood.actionHigh;
    if (maxScore == darkScore) return ContentMood.suspenseDark;
    if (maxScore == wonderScore) return ContentMood.wonderMystic;
    if (maxScore == warmScore) return ContentMood.intimateWarm;

    return ContentMood.neutral;
  }
}
