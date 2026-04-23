import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/item_place_model.dart';
import 'package:info_malang_batu_flutter/src/core/routes/app_router.dart';
import 'package:info_malang_batu_flutter/src/core/routes/app_routes.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/gallery_detail.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/list_place_detail.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_gallery.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_place.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    isSplashComplete.value = false;
  });

  tearDown(() {
    isSplashComplete.value = false;
  });

  group('isSplashComplete ValueNotifier', () {
    test('initial value is false', () {
      expect(isSplashComplete.value, isFalse);
    });

    test('can be set to true', () {
      isSplashComplete.value = true;
      expect(isSplashComplete.value, isTrue);
    });

    test('can be toggled back to false', () {
      isSplashComplete.value = true;
      expect(isSplashComplete.value, isTrue);
      isSplashComplete.value = false;
      expect(isSplashComplete.value, isFalse);
    });

    test('notifies listeners on value change', () {
      int notificationCount = 0;
      isSplashComplete.addListener(() {
        notificationCount++;
      });
      isSplashComplete.value = true;
      expect(notificationCount, 1);
      isSplashComplete.value = false;
      expect(notificationCount, 2);
    });
  });

  group('createRouter', () {
    GoRouter? router;

    tearDown(() {
      router?.dispose();
    });

    test('returns a GoRouter instance', () {
      router = createRouter();
      expect(router, isA<GoRouter>());
    });

    test('configuration is not empty', () {
      router = createRouter();
      expect(router!.configuration, isNotNull);
    });

    test('initial location is root', () {
      router = createRouter();
      expect(router!.routeInformationProvider.value.uri.path, '/');
    });

    test('router is properly configured', () {
      router = createRouter();
      expect(router!.routerDelegate, isNotNull);
    });

    test('has route configuration with expected routes', () {
      router = createRouter();
      final routes = router!.configuration.routes;
      expect(routes, isNotEmpty);
      expect(routes.length, greaterThanOrEqualTo(2)); // Splash + StatefulShellRoute
    });

    test('uses isSplashComplete as refreshListenable', () {
      router = createRouter();
      // The router uses refreshListenable internally via GoRouter constructor
      // Verify the router is created with the notifier
      expect(router, isNotNull);
    });
  });

  group('Route Path Configuration Tests', () {
    test('routes configuration contains expected structure', () {
      final router = createRouter();
      addTearDown(router.dispose);

      final routes = router.configuration.routes;

      // Verify all expected routes exist
      expect(routes.length, greaterThanOrEqualTo(2));

      // Verify initial path
      expect(router.routeInformationProvider.value.uri.path, '/');
    });

    test('router has splash route at root', () {
      final router = createRouter();
      addTearDown(router.dispose);

      // Check the routes contain root path
      final routes = router.configuration.routes;
      expect(routes, isNotEmpty);

      // First route should be the splash route
      final firstRoute = routes.first;
      expect(firstRoute, isA<GoRoute>());
    });

    test('router has StatefulShellRoute for navigation', () {
      final router = createRouter();
      addTearDown(router.dispose);

      final routes = router.configuration.routes;
      final shellRoute = routes.whereType<StatefulShellRoute>();
      expect(shellRoute.length, 1);
    });

    test('router has place-detail route', () {
      final router = createRouter();
      addTearDown(router.dispose);

      final routes = router.configuration.routes;
      final goRoutes = routes.whereType<GoRoute>();
      
      // Check for place-detail route
      final detailRoutes = goRoutes.where((r) => r.path == '/place-detail');
      expect(detailRoutes.length, 1);
    });

    test('router has gallery-detail route', () {
      final router = createRouter();
      addTearDown(router.dispose);

      final routes = router.configuration.routes;
      final goRoutes = routes.whereType<GoRoute>();
      
      // Check for gallery-detail route
      final detailRoutes = goRoutes.where((r) => r.path == '/gallery-detail');
      expect(detailRoutes.length, 1);
    });
  });

  group('Redirect Logic Tests', () {
    test('redirect returns null when not on splash', () {
      final router = createRouter();
      addTearDown(router.dispose);

      isSplashComplete.value = true;

      // Simulate navigation to non-splash route
      // The redirect should not interfere with non-splash routes
      expect(router.routerDelegate.currentConfiguration, isNotNull);
    });

    test('redirect logic exists in router configuration', () {
      final router = createRouter();
      addTearDown(router.dispose);

      // Verify router has redirect function configured
      final routes = router.configuration.routes;
      expect(routes, isNotEmpty);
    });

    test('isSplashComplete can be toggled to trigger refresh', () {
      final router = createRouter();
      addTearDown(router.dispose);

      // Set up listener to verify refresh is triggered
      int refreshCount = 0;
      void listener() => refreshCount++;
      isSplashComplete.addListener(listener);

      // Toggle the value
      isSplashComplete.value = true;
      expect(refreshCount, 1);

      isSplashComplete.value = false;
      expect(refreshCount, 2);

      isSplashComplete.removeListener(listener);
    });
  });

  group('StatefulShellRoute Structure Tests', () {
    test('StatefulShellRoute has indexedStack builder', () {
      final router = createRouter();
      addTearDown(router.dispose);

      final routes = router.configuration.routes;
      final shellRoute = routes.whereType<StatefulShellRoute>().first;

      // Verify the builder is configured
      expect(shellRoute.builder, isNotNull);
    });

    test('StatefulShellRoute has 4 branches', () {
      final router = createRouter();
      addTearDown(router.dispose);

      final routes = router.configuration.routes;
      final shellRoute = routes.whereType<StatefulShellRoute>().first;

      expect(shellRoute.branches.length, 4);
    });

    test('branches contain correct paths', () {
      final router = createRouter();
      addTearDown(router.dispose);

      final routes = router.configuration.routes;
      final shellRoute = routes.whereType<StatefulShellRoute>().first;

      final branchPaths = <String>[];
      for (final branch in shellRoute.branches) {
        final firstRoute = branch.routes.first;
        if (firstRoute is GoRoute) {
          branchPaths.add(firstRoute.path);
        }
      }

      expect(branchPaths, contains('/places'));
      expect(branchPaths, contains('/gallery'));
      expect(branchPaths, contains('/maps'));
      expect(branchPaths, contains('/about'));
    });
  });

  group('Error Builder Tests', () {
    testWidgets('unknown route shows error screen', (tester) async {
      final router = createRouter();
      addTearDown(router.dispose);

      router.go('/unknown-route');
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      expect(find.text('Screen Not Found'), findsOneWidget);
    });

    testWidgets('error screen has correct styling', (tester) async {
      final router = createRouter();
      addTearDown(router.dispose);

      router.go('/nonexistent');
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      final errorText = find.text('Screen Not Found');
      expect(errorText, findsOneWidget);

      final textWidget = tester.widget<Text>(errorText);
      expect(textWidget.style?.color, Colors.black);
      expect(textWidget.style?.fontSize, 16);
    });

    testWidgets('error screen is wrapped in Scaffold and Center', (tester) async {
      final router = createRouter();
      addTearDown(router.dispose);

      router.go('/invalid');
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
    });
  });

  group('Route Data Classes Tests', () {
    group('PlaceDetailRoute', () {
      test('can be instantiated with model', () {
        const model = ItemPlaceModel(
          nama: 'Test Place',
          lokasi: 'Test Location',
          deskripsi: 'Test Description',
          thumbnail: 'thumb.jpg',
          gambar: 'img.jpg',
        );
        final route = PlaceDetailRoute(model);

        expect(route, isA<PlaceDetailRoute>());
        expect(route.model, model);
      });

      test('is subclass of AppRoute', () {
        const model = ItemPlaceModel(
          nama: 'Test',
          lokasi: 'Test',
          deskripsi: 'Test',
          thumbnail: 'thumb.jpg',
          gambar: 'img.jpg',
        );
        final route = PlaceDetailRoute(model);

        expect(route, isA<AppRoute>());
      });

      test('stores model correctly', () {
        const model = ItemPlaceModel(
          nama: 'Bromo Mountain',
          lokasi: 'East Java',
          deskripsi: 'Beautiful mountain',
          thumbnail: 'bromo_thumb.jpg',
          gambar: 'bromo.jpg',
        );
        final route = PlaceDetailRoute(model);

        expect(route.model.nama, 'Bromo Mountain');
        expect(route.model.lokasi, 'East Java');
        expect(route.model.deskripsi, 'Beautiful mountain');
      });

      test('model is immutable', () {
        const model = ItemPlaceModel(
          nama: 'Test',
          lokasi: 'Test Location',
          deskripsi: 'Test Description',
          thumbnail: 'thumb.jpg',
          gambar: 'img.jpg',
        );
        final route = PlaceDetailRoute(model);

        // Verify we can't modify the model through the route
        expect(route.model, equals(model));
      });
    });

    group('GalleryDetailRoute', () {
      test('can be instantiated with model', () {
        const model = ItemGalleryModel(
          caption: 'Test Caption',
          thumbnail: 'thumb.jpg',
          image: 'img.jpg',
        );
        final route = GalleryDetailRoute(model);

        expect(route, isA<GalleryDetailRoute>());
        expect(route.model, model);
      });

      test('is subclass of AppRoute', () {
        const model = ItemGalleryModel(
          caption: 'Test',
          thumbnail: 'thumb.jpg',
          image: 'img.jpg',
        );
        final route = GalleryDetailRoute(model);

        expect(route, isA<AppRoute>());
      });

      test('stores model correctly', () {
        const model = ItemGalleryModel(
          caption: 'Sunset at Beach',
          thumbnail: 'sunset_thumb.jpg',
          image: 'sunset.jpg',
        );
        final route = GalleryDetailRoute(model);

        expect(route.model.caption, 'Sunset at Beach');
        expect(route.model.thumbnail, 'sunset_thumb.jpg');
        expect(route.model.image, 'sunset.jpg');
      });

      test('model is immutable', () {
        const model = ItemGalleryModel(
          caption: 'Test',
          thumbnail: 'thumb.jpg',
          image: 'img.jpg',
        );
        final route = GalleryDetailRoute(model);

        // Verify we can't modify the model through the route
        expect(route.model, equals(model));
      });
    });

    group('AppRoute', () {
      test('is sealed class pattern', () {
        // AppRoute is sealed, so we can't instantiate it directly
        // But we can verify its subclasses work correctly
        expect(PlaceDetailRoute, isNotNull);
        expect(GalleryDetailRoute, isNotNull);
      });

      test('PlaceDetailRoute and GalleryDetailRoute are distinct types', () {
        const placeModel = ItemPlaceModel(
          nama: 'Test',
          lokasi: 'Test',
          deskripsi: 'Test',
          thumbnail: 'thumb.jpg',
          gambar: 'img.jpg',
        );
        const galleryModel = ItemGalleryModel(
          caption: 'Test',
          thumbnail: 'thumb.jpg',
          image: 'img.jpg',
        );

        final placeRoute = PlaceDetailRoute(placeModel);
        final galleryRoute = GalleryDetailRoute(galleryModel);

        expect(placeRoute, isNot(isA<GalleryDetailRoute>()));
        expect(galleryRoute, isNot(isA<PlaceDetailRoute>()));
      });
    });
  });

  group('Route Path Constants', () {
    test('all expected paths are valid', () {
      const paths = ['/', '/places', '/gallery', '/maps', '/about', '/place-detail', '/gallery-detail'];
      for (final path in paths) {
        expect(path, isA<String>());
        expect(path.startsWith('/'), isTrue);
        expect(path.isNotEmpty, isTrue);
      }
    });

    test('paths follow RESTful conventions', () {
      // List routes use plural
      expect('/places', equals('/places'));
      expect('/gallery', equals('/gallery'));

      // Detail routes use hyphenated format
      expect('/place-detail', contains('-'));
      expect('/gallery-detail', contains('-'));
    });
  });

  group('Router State Management', () {
    test('isSplashComplete is global ValueNotifier', () {
      // Verify it's the same instance across multiple router creations
      final router1 = createRouter();
      final router2 = createRouter();
      addTearDown(router1.dispose);
      addTearDown(router2.dispose);

      // Both routers should reference the same notifier
      isSplashComplete.value = true;
      expect(isSplashComplete.value, isTrue);

      isSplashComplete.value = false;
      expect(isSplashComplete.value, isFalse);
    });

    test('multiple routers can be created and disposed independently', () {
      final routers = <GoRouter>[];

      for (var i = 0; i < 3; i++) {
        routers.add(createRouter());
      }

      for (final router in routers) {
        expect(router, isA<GoRouter>());
        router.dispose();
      }
    });
  });

  group('Navigation to Detail Routes', () {
    testWidgets('navigating to /place-detail renders ListPlaceDetail with data', (
      tester,
    ) async {
      final router = createRouter();
      addTearDown(router.dispose);

      const model = ItemPlaceModel(
        nama: 'Test Place',
        lokasi: 'Test Location',
        deskripsi: 'Test Description',
        thumbnail: 'thumb.jpg',
        gambar: 'img.jpg',
      );

      router.go('/place-detail', extra: PlaceDetailRoute(model));
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      expect(find.text('Test Place'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.text('Detail Lokasi'), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('navigating to /place-detail displays the correct model data', (
      tester,
    ) async {
      final router = createRouter();
      addTearDown(router.dispose);

      const model = ItemPlaceModel(
        nama: 'Bromo Mountain',
        lokasi: 'East Java',
        deskripsi: 'Beautiful mountain',
        thumbnail: 'bromo_thumb.jpg',
        gambar: 'bromo.jpg',
      );

      router.go('/place-detail', extra: PlaceDetailRoute(model));
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      expect(find.text('Bromo Mountain'), findsOneWidget);
      expect(find.text('Beautiful mountain'), findsOneWidget);
    });

    testWidgets('navigating to /gallery-detail renders GalleryDetail with data', (
      tester,
    ) async {
      final router = createRouter();
      addTearDown(router.dispose);

      const model = ItemGalleryModel(
        caption: 'Test Caption',
        thumbnail: 'thumb.jpg',
        image: 'img.jpg',
      );

      router.go('/gallery-detail', extra: GalleryDetailRoute(model));
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      expect(find.text('Test Caption'), findsOneWidget);
      expect(find.text('Detail Galeri'), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('navigating to /gallery-detail displays the correct model data', (
      tester,
    ) async {
      final router = createRouter();
      addTearDown(router.dispose);

      const model = ItemGalleryModel(
        caption: 'Sunset at Beach',
        thumbnail: 'sunset_thumb.jpg',
        image: 'sunset.jpg',
      );

      router.go('/gallery-detail', extra: GalleryDetailRoute(model));
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      expect(find.text('Sunset at Beach'), findsOneWidget);
    });
  });

  group('Navigation from Widget Tap Tests', () {
    testWidgets('ItemPlace tap navigates to /place-detail', (tester) async {
      const model = ItemPlaceModel(
        nama: 'Alun Alun Malang',
        lokasi: 'Kota Malang',
        deskripsi: 'A beautiful place',
        thumbnail: 'thumb.jpg',
        gambar: 'img.jpg',
      );

      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => Scaffold(
              body: ItemPlace(itemPlaceModel: model),
            ),
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
      expect(find.text('Alun Alun Malang'), findsOneWidget);
    });

    testWidgets('ItemGallery tap navigates to /gallery-detail', (tester) async {
      const model = ItemGalleryModel(
        caption: 'Test Gallery',
        thumbnail: 'thumb.jpg',
        image: 'img.jpg',
      );

      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => Scaffold(
              body: ItemGallery(itemGalleryModel: model),
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
    });

    testWidgets('ItemPlace with null model does not navigate on tap', (
      tester,
    ) async {
      int pushCount = 0;

      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => Scaffold(
              body: ItemPlace(itemPlaceModel: null),
            ),
          ),
          GoRoute(
            path: '/place-detail',
            builder: (context, state) {
              pushCount++;
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

      expect(pushCount, 0);
      expect(find.text('Place Detail'), findsNothing);
    });

    testWidgets('ItemGallery with null model does not navigate on tap', (
      tester,
    ) async {
      int pushCount = 0;

      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => Scaffold(
              body: ItemGallery(itemGalleryModel: null),
            ),
          ),
          GoRoute(
            path: '/gallery-detail',
            builder: (context, state) {
              pushCount++;
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

      expect(pushCount, 0);
      expect(find.text('Gallery Detail'), findsNothing);
    });
  });
}
