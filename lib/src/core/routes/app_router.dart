import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/splash_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/splash_event.dart';
import 'package:info_malang_batu_flutter/src/core/routes/app_routes.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/about.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/gallery.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/gallery_detail.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/home.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/list_place.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/list_place_detail.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/maps_place.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/splash.dart';

final ValueNotifier<bool> isSplashComplete = ValueNotifier(false);

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: isSplashComplete,
    redirect: (context, state) {
      final isSplash = state.matchedLocation == '/';
      if (isSplash && isSplashComplete.value) {
        return '/places';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (_) => SplashBloc()..add(SplashInitEvent()),
          child: const Splash(),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Home(navigationShell: navigationShell, child: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/places',
                builder: (context, state) => const ListPlace(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/gallery',
                builder: (context, state) => const Gallery(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/maps',
                builder: (context, state) => const MapsPlace(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/about',
                builder: (context, state) => const About(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/place-detail',
        builder: (context, state) {
          final route = state.extra as PlaceDetailRoute;
          return ListPlaceDetail(itemPlaceModel: route.model);
        },
      ),
      GoRoute(
        path: '/gallery-detail',
        builder: (context, state) {
          final route = state.extra as GalleryDetailRoute;
          return GalleryDetail(itemGalleryModel: route.model);
        },
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text(
          'Screen Not Found',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    ),
  );
}
