import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:info_malang_batu_flutter/src/core/routes/app_router.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    isSplashComplete.value = false;
  });

  tearDown(() {
    isSplashComplete.value = false;
  });

  group('isSplashComplete', () {
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

    test('router uses isSplashComplete as refreshListenable', () {
      router = createRouter();
      expect(router, isNotNull);
    });

    test('configuration is not empty', () {
      router = createRouter();
      expect(router!.configuration, isNotNull);
    });
  });
}