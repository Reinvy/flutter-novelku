import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:novelku/core/theme/spatial_tokens.dart';
import 'package:novelku/core/widgets/dynamic_ambient_glow.dart';
import 'package:novelku/core/widgets/genre_atmosphere_canvas.dart';
import 'package:novelku/core/widgets/interactive_divider.dart';
import 'package:novelku/core/widgets/spatial_parallax_container.dart';
import 'package:novelku/features/reader/presentation/mood_analyzer.dart';
import 'package:novelku/features/reader/presentation/physical_ribbon_bookmark.dart';

void main() {
  group('Spatial Tokens & Mood Analyzer Tests', () {
    test('GenreVisualConfig accurately classifies genre keywords', () {
      expect(
        GenreVisualConfig.fromGenreString('Kisah sihir dunia fantasi').type,
        GenreAtmosphereType.fantasy,
      );
      expect(
        GenreVisualConfig.fromGenreString('Perjalanan luar angkasa robot cyberpunk').type,
        GenreAtmosphereType.sciFi,
      );
      expect(
        GenreVisualConfig.fromGenreString('Kisah cinta dan drama romantis').type,
        GenreAtmosphereType.romance,
      );
      expect(
        GenreVisualConfig.fromGenreString('Misteri pembunuhan detektif').type,
        GenreAtmosphereType.mystery,
      );
      expect(
        GenreVisualConfig.fromGenreString('Catatan harian biasa').type,
        GenreAtmosphereType.classic,
      );
    });

    test('MoodAnalyzer detects emotional mood from paragraph text', () {
      const warmText = 'Dia memeluk erat dengan penuh cinta dan senyum yang hangat dan lembut di hatinya.';
      expect(MoodAnalyzer.analyzeText(warmText), ContentMood.intimateWarm);

      const darkText = 'Bayangan gelap yang dingin menyelimuti malam, rasa takut dan jerit kematian terdengar di kuburan.';
      expect(MoodAnalyzer.analyzeText(darkText), ContentMood.suspenseDark);

      const actionText = 'Pedang membelah api dan ledakan hancur saat musuh bertarung dengan serang dan tembak senjata.';
      expect(MoodAnalyzer.analyzeText(actionText), ContentMood.actionHigh);

      const wonderText = 'Mantra sihir bercahaya di langit kosmik dengan kristal portal dewa yang megah dan ajaib.';
      expect(MoodAnalyzer.analyzeText(wonderText), ContentMood.wonderMystic);

      const neutralText = 'Mereka berjalan santai menuju meja makan.';
      expect(MoodAnalyzer.analyzeText(neutralText), ContentMood.neutral);
    });
  });

  group('Spatial Widgets Rendering Tests', () {
    testWidgets('GenreAtmosphereCanvas renders without crashing', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: GenreAtmosphereCanvas(
                genreConfig: GenreVisualConfig.fantasy,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(GenreAtmosphereCanvas), findsOneWidget);
    });

    testWidgets('DynamicAmbientGlow wraps child correctly', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: DynamicAmbientGlow(
                mood: ContentMood.intimateWarm,
                child: Text('Ambient Glow Content'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Ambient Glow Content'), findsOneWidget);
    });

    testWidgets('InteractiveChapterDivider renders and responds to taps', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: InteractiveChapterDivider(
              accentColor: Colors.amber,
              title: 'Bab 1: Awal Mula',
            ),
          ),
        ),
      );

      expect(find.byType(InteractiveChapterDivider), findsOneWidget);
      await tester.tap(find.byType(InteractiveChapterDivider));
      await tester.pump(const Duration(milliseconds: 100));
    });

    testWidgets('PhysicalRibbonBookmark renders and triggers toggle', (tester) async {
      bool toggled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                PhysicalRibbonBookmark(
                  isBookmarked: false,
                  onToggleBookmark: () => toggled = true,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(PhysicalRibbonBookmark), findsOneWidget);
      expect(toggled, isFalse);
    });

    testWidgets('SpatialParallaxContainer wraps children in SpatialTiltScope', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: SpatialParallaxContainer(
                child: SpatialParallaxLayer(
                  depth: 0.5,
                  child: Text('Parallax Child'),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Parallax Child'), findsOneWidget);
    });
  });
}
