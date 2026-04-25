import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/core/routes/app_routes.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/gallery_detail.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_gallery.dart';

void main() {
  const testGalleryModel = ItemGalleryModel(
    caption: 'Zona Infinite World',
    thumbnail: 'https://example.com/thumb.jpg',
    image: 'https://example.com/img.jpg',
  );

  group('ItemGallery Widget Tests', () {
    testWidgets('should display InkWell for tap handling', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: ItemGallery(itemGalleryModel: testGalleryModel)),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('should render ItemGallery widget with model', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: ItemGallery(itemGalleryModel: testGalleryModel)),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ItemGallery), findsOneWidget);
    });

    testWidgets('should render ItemGallery widget with null model', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: ItemGallery(itemGalleryModel: null)),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ItemGallery), findsOneWidget);
    });

    testWidgets('tapping ItemGallery navigates to gallery-detail screen', (
      tester,
    ) async {
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const Scaffold(
              body: ItemGallery(itemGalleryModel: testGalleryModel),
            ),
          ),
          GoRoute(
            path: '/gallery-detail',
            builder: (context, state) {
              final route = state.extra as GalleryDetailRoute;
              return GalleryDetail(itemGalleryModel: route.model);
            },
          ),
        ],
      );
      addTearDown(router.dispose);

      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      expect(find.text('Detail Galeri'), findsOneWidget);
      expect(find.byType(GalleryDetail), findsOneWidget);
    });

    testWidgets('tapping ItemGallery with null model does not navigate', (
      tester,
    ) async {
      int navigationCount = 0;

      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) =>
                const Scaffold(body: ItemGallery(itemGalleryModel: null)),
          ),
          GoRoute(
            path: '/gallery-detail',
            builder: (context, state) {
              navigationCount++;
              return const Scaffold(body: Text('Gallery Detail'));
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
      expect(find.text('Gallery Detail'), findsNothing);
    });

    testWidgets('tapping ItemGallery passes correct model to detail screen', (
      tester,
    ) async {
      const model = ItemGalleryModel(
        caption: 'Sunset at Beach',
        thumbnail: 'sunset_thumb.jpg',
        image: 'sunset.jpg',
      );

      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) =>
                const Scaffold(body: ItemGallery(itemGalleryModel: model)),
          ),
          GoRoute(
            path: '/gallery-detail',
            builder: (context, state) {
              final route = state.extra as GalleryDetailRoute;
              return GalleryDetail(itemGalleryModel: route.model);
            },
          ),
        ],
      );
      addTearDown(router.dispose);

      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      expect(find.text('Sunset at Beach'), findsOneWidget);
    });
  });
}
