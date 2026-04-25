import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/splash_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/splash_event.dart';
import 'package:info_malang_batu_flutter/src/core/routes/app_router.dart';
import 'package:info_malang_batu_flutter/src/core/states/splash_state.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/splash.dart';
import 'package:mocktail/mocktail.dart';

import 'mock/splash_bloc_mock.dart';

class FakeSplashEvent extends Fake implements SplashEvent {}

void main() {
  late SplashBlocMock splashBlocMock;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(FakeSplashEvent());

    splashBlocMock = SplashBlocMock();
    isSplashComplete.value = false;

    when(
      () => splashBlocMock.state,
    ).thenReturn(const SplashState(version: '2.0.8'));
    when(() => splashBlocMock.stream).thenAnswer(
      (_) => Stream.fromIterable([const SplashState(version: '2.0.8')]),
    );
  });

  tearDown(() {
    isSplashComplete.value = false;
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<SplashBloc>.value(
        value: splashBlocMock,
        child: const Splash(),
      ),
    );
  }

  group('Splash Widget Tests', () {
    testWidgets('should display app title Info Malang Batu', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.text('Info Malang Batu'), findsOneWidget);

      // Drain the Future.delayed timer from initState
      await tester.pump(const Duration(seconds: 2));
    });

    testWidgets('should display Scaffold', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byType(Scaffold), findsOneWidget);

      await tester.pump(const Duration(seconds: 2));
    });

    testWidgets('should display version text from bloc state', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.text('versi 2.0.8'), findsOneWidget);

      await tester.pump(const Duration(seconds: 2));
    });

    testWidgets('should display teal background color', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      final container = tester.widget<Container>(
        find.ancestor(
          of: find.text('Info Malang Batu'),
          matching: find.byType(Container),
        ),
      );
      expect(container.color, Colors.teal);

      await tester.pump(const Duration(seconds: 2));
    });

    testWidgets('should set isSplashComplete to true after 2 seconds', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(isSplashComplete.value, isFalse);

      await tester.pump(const Duration(seconds: 2));

      expect(isSplashComplete.value, isTrue);
    });

    testWidgets('should not set isSplashComplete before 2 seconds', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(isSplashComplete.value, isFalse);

      await tester.pump(const Duration(seconds: 1));

      expect(isSplashComplete.value, isFalse);

      // Drain remaining timer
      await tester.pump(const Duration(seconds: 1));
    });
  });
}
