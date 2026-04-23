import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/maps_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/maps_event.dart';
import 'package:info_malang_batu_flutter/src/core/states/maps_state.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/maps_place.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import 'mock/fake_google_maps_platform.dart';
import 'mock/maps_bloc_mock.dart';
import 'response/maps.dart';

class FakeMapsEvent extends Fake implements MapsEvent {}

void main() {
  late FakeGoogleMapsFlutterPlatform fakePlatform;
  late MapsBlocMock mapsBlocMock;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    fakePlatform = FakeGoogleMapsFlutterPlatform();
    GoogleMapsFlutterPlatform.instance = fakePlatform;

    registerFallbackValue(FakeMapsEvent());

    mapsBlocMock = MapsBlocMock();

    when(() => mapsBlocMock.state).thenReturn(
      MapsState(
        listPin: responseSuccessMaps,
        locationService: true,
        permissionStatus: PermissionStatus.granted,
      ),
    );
    when(() => mapsBlocMock.stream).thenAnswer(
      (_) => Stream.fromIterable([
        MapsState(
          listPin: responseSuccessMaps,
          locationService: true,
          permissionStatus: PermissionStatus.granted,
        ),
      ]),
    );
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<MapsBloc>.value(
        value: mapsBlocMock,
        child: const MapsPlace(),
      ),
    );
  }

  group('MapsPlace Widget Tests', () {
    testWidgets('should display Scaffold with AppBar', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('should display Peta title in AppBar', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Peta'), findsOneWidget);
    });

    testWidgets('should display refresh button', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.refresh), findsOneWidget);
    });

    testWidgets('should display GoogleMap', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(fakePlatform.createdIds, isNotEmpty);
    });

    testWidgets('should display map markers from state', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(fakePlatform.createdIds, isNotEmpty);
      final map = fakePlatform.lastCreatedMap;

      expect(map.markerUpdates, isNotEmpty);
    });

    testWidgets('should have correct initial camera position', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(fakePlatform.createdIds, isNotEmpty);
      final map = fakePlatform.lastCreatedMap;

      expect(
        map.widgetConfiguration.initialCameraPosition.target.latitude,
        -7.982914,
      );
      expect(
        map.widgetConfiguration.initialCameraPosition.target.longitude,
        112.630875,
      );
      expect(map.widgetConfiguration.initialCameraPosition.zoom, 9.0);
    });

    testWidgets('should enable myLocation when permission is granted', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(fakePlatform.createdIds, isNotEmpty);
      final map = fakePlatform.lastCreatedMap;

      expect(map.mapConfiguration.myLocationEnabled, true);
    });
  });
}
