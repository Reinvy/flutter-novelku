import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:novelku/core/theme/app_theme.dart';

void main() {
  testWidgets('AppTheme menghasilkan tema light dan dark tanpa error', (tester) async {
    final light = AppTheme.light();
    final dark = AppTheme.dark();

    expect(light.brightness, Brightness.light);
    expect(dark.brightness, Brightness.dark);
    expect(light.colorScheme.primary, isNotNull);
    expect(dark.colorScheme.primary, isNotNull);
  });

  testWidgets('MaterialApp dengan tema NovelKu dapat dibuild', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          home: const Scaffold(body: Text('NovelKu')),
        ),
      ),
    );
    expect(find.text('NovelKu'), findsOneWidget);
  });
}
