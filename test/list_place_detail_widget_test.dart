import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/list_place_detail.dart';
import 'response/list_place_all.dart';

void main() {
  // Use the first item from the test response data
  final mockPlace = responseSuccessListPlaceAll.first;

  // Helper function to create the widget under test
  Widget createWidgetUnderTest() {
    return MaterialApp(home: ListPlaceDetail(itemPlaceModel: mockPlace));
  }

  group('ListPlaceDetail Widget Tests', () {
    testWidgets('should display place name', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Alun Alun Malang'), findsOneWidget);
    });

    testWidgets('should display place description', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(
        find.text(
          'alun alun ini baru saja dipermak pada tahun 2015. yang sebelumnya terlihat semrawut sekarang menjadi lebih tertata.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('should display app bar with correct title', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Detail Lokasi'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('should display image', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final imageFinder = find.byType(CachedNetworkImage);
      expect(imageFinder, findsOneWidget);
    });

    testWidgets('should handle null itemPlaceModel gracefully', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: ListPlaceDetail(itemPlaceModel: null)),
      );
      await tester.pumpAndSettle();

      // Should not throw any exceptions and should still render the screen
      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}
