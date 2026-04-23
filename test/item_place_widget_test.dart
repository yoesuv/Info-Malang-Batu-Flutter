import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/item_place_model.dart';
import 'package:info_malang_batu_flutter/src/core/routes/app_routes.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/list_place_detail.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_place.dart';

void main() {
  const testPlaceModel = ItemPlaceModel(
    nama: 'Alun Alun Malang',
    lokasi: 'Kota Malang',
    deskripsi: 'A beautiful city square',
    thumbnail: 'https://example.com/thumb.jpg',
    gambar: 'https://example.com/img.jpg',
  );

  group('ItemPlace Widget Tests', () {
    testWidgets('should display place name', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: ItemPlace(itemPlaceModel: testPlaceModel)),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Alun Alun Malang'), findsOneWidget);
    });

    testWidgets('should display place location', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: ItemPlace(itemPlaceModel: testPlaceModel)),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Kota Malang'), findsOneWidget);
    });

    testWidgets('should display empty strings when model is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: ItemPlace(itemPlaceModel: null)),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ItemPlace), findsOneWidget);
    });

    testWidgets('should have InkWell for tap handling', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: ItemPlace(itemPlaceModel: testPlaceModel)),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('tapping ItemPlace navigates to place-detail screen', (
      tester,
    ) async {
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) =>
                const Scaffold(body: ItemPlace(itemPlaceModel: testPlaceModel)),
          ),
          GoRoute(
            path: '/place-detail',
            builder: (context, state) {
              final route = state.extra as PlaceDetailRoute;
              return ListPlaceDetail(itemPlaceModel: route.model);
            },
          ),
        ],
      );
      addTearDown(router.dispose);

      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      expect(find.text('Alun Alun Malang'), findsOneWidget);

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      expect(find.text('Detail Lokasi'), findsOneWidget);
      expect(find.text('Alun Alun Malang'), findsWidgets);
      expect(find.byType(ListPlaceDetail), findsOneWidget);
    });

    testWidgets('tapping ItemPlace with null model does not navigate', (
      tester,
    ) async {
      int navigationCount = 0;

      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) =>
                const Scaffold(body: ItemPlace(itemPlaceModel: null)),
          ),
          GoRoute(
            path: '/place-detail',
            builder: (context, state) {
              navigationCount++;
              return const Scaffold(body: Text('Place Detail'));
            },
          ),
        ],
      );
      addTearDown(router.dispose);

      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      expect(navigationCount, 0);
      expect(find.text('Place Detail'), findsNothing);
    });

    testWidgets('tapping ItemPlace passes correct model to detail screen', (
      tester,
    ) async {
      const model = ItemPlaceModel(
        nama: 'Bromo Mountain',
        lokasi: 'East Java',
        deskripsi: 'Beautiful mountain view',
        thumbnail: 'bromo_thumb.jpg',
        gambar: 'bromo.jpg',
      );

      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) =>
                const Scaffold(body: ItemPlace(itemPlaceModel: model)),
          ),
          GoRoute(
            path: '/place-detail',
            builder: (context, state) {
              final route = state.extra as PlaceDetailRoute;
              return ListPlaceDetail(itemPlaceModel: route.model);
            },
          ),
        ],
      );
      addTearDown(router.dispose);

      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      expect(find.text('Bromo Mountain'), findsOneWidget);
      expect(find.text('Beautiful mountain view'), findsOneWidget);
    });
  });
}
