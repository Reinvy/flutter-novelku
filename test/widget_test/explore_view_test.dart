import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:novelku/view_models/novel_view_model.dart';
import 'package:novelku/views/main/explore_view.dart';
import 'package:provider/provider.dart';

void main() {
  group('Explore View', () {
    testWidgets('Judul Halaman Harus Explore', (tester) async {
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => NovelViewModel(),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: ExploreView(),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Explore'), findsOneWidget);
    });

    testWidgets('Body Memiliki ListView', (WidgetTester tester) async {
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => NovelViewModel(),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: ExploreView(),
          ),
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Halaman Memiliki Icon Search, Sort, dan Refresh',
        (WidgetTester tester) async {
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => NovelViewModel(),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: ExploreView(),
          ),
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.sort_by_alpha), findsOneWidget);
      expect(find.byIcon(Icons.refresh), findsOneWidget);
    });
  });
}
