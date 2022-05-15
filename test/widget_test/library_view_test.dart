import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:novelku/view_models/novel_view_model.dart';
import 'package:novelku/views/main/library_view.dart';
import 'package:provider/provider.dart';

void main() {
  group('Explore View', () {
    testWidgets('Judul Halaman Harus Library', (tester) async {
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => NovelViewModel(),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: LibraryView(),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Library'), findsOneWidget);
    });

    testWidgets('Body Memiliki GridView', (WidgetTester tester) async {
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => NovelViewModel(),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: LibraryView(),
          ),
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('Halaman Memiliki Icon Sort', (WidgetTester tester) async {
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => NovelViewModel(),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: LibraryView(),
          ),
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.sort_by_alpha), findsOneWidget);
    });
  });
}
