import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:novelku/view_models/novel_view_model.dart';
import 'package:novelku/view_models/publish_view_model.dart';
import 'package:novelku/views/main/post_novel_view.dart';
import 'package:provider/provider.dart';

void main() {
  group('Post Novel View', () {
    testWidgets('Judul Halaman Harus Upload Novel', (tester) async {
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => NovelViewModel(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => PublishViewModel(),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: PostNovelView(),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Upload Novel'), findsOneWidget);
    });

    testWidgets('Body Memiliki 3 TextFormField', (WidgetTester tester) async {
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => NovelViewModel(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => PublishViewModel(),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: PostNovelView(),
          ),
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(TextFormField), findsNWidgets(3));
    });
  });
}
