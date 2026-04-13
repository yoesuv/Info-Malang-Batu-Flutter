import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/about_libraries.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_library.dart';

void main() {
  group('AboutLibraries Widget Tests', () {
    testWidgets('should show loading text initially', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutLibraries(),
        ),
      );

      // Initially should show loading text
      expect(find.text('Memuat List Library...'), findsOneWidget);
    });

    testWidgets('should show library list after loading', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutLibraries(),
        ),
      );

      // Wait for the bloc to emit the loaded state
      await tester.pumpAndSettle();

      // Verify at least some library items are displayed
      // ListView.builder only builds visible items
      expect(find.byType(ItemLibrary), findsWidgets);
      expect(find.byType(ItemLibrary), isNot(findsNothing));
    });

    testWidgets('should display library names', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutLibraries(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify at least one library name is displayed
      expect(find.text('Flutter'), findsOneWidget);
      expect(find.text('Bloc Library'), findsOneWidget);
    });

    testWidgets('should display library URLs', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutLibraries(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify at least one library URL is displayed
      expect(find.text('https://flutter.dev'), findsOneWidget);
      expect(find.text('https://bloclibrary.dev/'), findsOneWidget);
    });

    testWidgets('should display ListView when data is loaded', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutLibraries(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify ListView is displayed
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('should not show loading text when data is loaded',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutLibraries(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify loading text is not displayed
      expect(find.text('Memuat List Library...'), findsNothing);
    });

    testWidgets('should display Scaffold', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutLibraries(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify Scaffold is displayed
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('should scroll to show more items', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutLibraries(),
        ),
      );

      await tester.pumpAndSettle();

      // Get initial number of visible items
      final initialItemCount = find.byType(ItemLibrary).evaluate().length;
      expect(initialItemCount, isPositive);

      // Scroll down
      await tester.drag(find.byType(ListView), const Offset(0, -300));
      await tester.pumpAndSettle();

      // After scrolling, we should still have items visible
      expect(find.byType(ItemLibrary), findsWidgets);
    });
  });
}
