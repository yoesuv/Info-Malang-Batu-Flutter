import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/about_changelog.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_changelog.dart';

void main() {
  group('AboutChangelog Widget Tests', () {
    testWidgets('should show loading text initially', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutChangelog()));

      expect(find.text('Memuat Changelog...'), findsOneWidget);
    });

    testWidgets('should show changelog list after loading', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutChangelog()));

      await tester.pumpAndSettle();

      expect(find.byType(ItemChangelog), findsWidgets);
      expect(find.byType(ItemChangelog), isNot(findsNothing));
    });

    testWidgets('should display version names', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutChangelog()));

      await tester.pumpAndSettle();

      expect(find.text('Versi 2.0.8'), findsOneWidget);
      expect(find.text('Versi 2.0.7'), findsOneWidget);
    });

    testWidgets('should display changelog content', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutChangelog()));

      await tester.pumpAndSettle();

      expect(find.text('• update libraries'), findsWidgets);
    });

    testWidgets('should display ListView when data is loaded', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutChangelog()));

      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('should not show loading text when data is loaded', (
      tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: AboutChangelog()));

      await tester.pumpAndSettle();

      expect(find.text('Memuat Changelog...'), findsNothing);
    });

    testWidgets('should display Scaffold', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutChangelog()));

      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('should scroll to show more items', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutChangelog()));

      await tester.pumpAndSettle();

      final initialItemCount = find.byType(ItemChangelog).evaluate().length;
      expect(initialItemCount, isPositive);

      await tester.drag(find.byType(ListView), const Offset(0, -300));
      await tester.pumpAndSettle();

      expect(find.byType(ItemChangelog), findsWidgets);
    });
  });
}
