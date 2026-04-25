import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/maps_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/maps_event.dart';
import 'package:info_malang_batu_flutter/src/core/models/maps/list_item_maps_pin_model.dart';
import 'package:info_malang_batu_flutter/src/core/states/maps_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import 'mock/location_service_mock.dart';
import 'mock/maps_repository_mock.dart';
import 'response/maps.dart';
import 'utils/json_helper.dart';

void main() {
  late MapsBloc mapsBloc;
  late MapsRepositoryMock mapsRepositoryMock;
  late LocationServiceMock locationServiceMock;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mapsRepositoryMock = MapsRepositoryMock();
    locationServiceMock = LocationServiceMock();
    mapsBloc = MapsBloc(mapsRepositoryMock, locationServiceMock);
  });

  tearDown(() {
    mapsBloc.close();
  });

  test('JSON valid data maps', () async {
    final response = await loadJsonFromAsset('test/json/maps.json');
    final List<dynamic> jsonList = jsonDecode(response);
    final maps = ListItemMapsPinModel.fromJson(jsonList);
    expect(maps.listItemGalleryModel.length, 2);
  });

  blocTest<MapsBloc, MapsState>(
    'MapsEventInit is added and data is fetched successfully',
    build: () => mapsBloc,
    act: (bloc) => bloc.add(MapsEventInit()),
    expect: () => [MapsState(listPin: responseSuccessMaps)],
  );

  blocTest<MapsBloc, MapsState>(
    'MapsCheckServiceLocation on iOS emits locationService true',
    build: () => mapsBloc,
    setUp: () {
      when(() => locationServiceMock.isIOS).thenReturn(true);
    },
    act: (bloc) => bloc.add(MapsCheckServiceLocation()),
    expect: () => [const MapsState(locationService: true)],
  );

  blocTest<MapsBloc, MapsState>(
    'MapsCheckServiceLocation on Android with service enabled emits true',
    build: () => mapsBloc,
    setUp: () {
      when(() => locationServiceMock.isIOS).thenReturn(false);
      when(
        () => locationServiceMock.locationServiceStatus,
      ).thenAnswer((_) async => ServiceStatus.enabled);
    },
    act: (bloc) => bloc.add(MapsCheckServiceLocation()),
    expect: () => [const MapsState(locationService: true)],
  );

  blocTest<MapsBloc, MapsState>(
    'MapsCheckServiceLocation on Android with service disabled emits false',
    build: () => mapsBloc,
    setUp: () {
      when(() => locationServiceMock.isIOS).thenReturn(false);
      when(
        () => locationServiceMock.locationServiceStatus,
      ).thenAnswer((_) async => ServiceStatus.disabled);
    },
    act: (bloc) => bloc.add(MapsCheckServiceLocation()),
    expect: () => [
      const MapsState(locationService: true),
      const MapsState(locationService: false),
    ],
  );

  blocTest<MapsBloc, MapsState>(
    'MapsEventPermissionLocation emits granted permissionStatus',
    build: () => mapsBloc,
    setUp: () {
      when(
        () => locationServiceMock.requestLocationPermission(),
      ).thenAnswer((_) async => PermissionStatus.granted);
    },
    act: (bloc) => bloc.add(MapsEventPermissionLocation()),
    expect: () => [const MapsState(permissionStatus: PermissionStatus.granted)],
  );

  blocTest<MapsBloc, MapsState>(
    'MapsEventPermissionLocation emits denied permissionStatus',
    build: () => mapsBloc,
    setUp: () {
      when(
        () => locationServiceMock.requestLocationPermission(),
      ).thenAnswer((_) async => PermissionStatus.denied);
    },
    act: (bloc) => bloc.add(MapsEventPermissionLocation()),
    expect: () => [const MapsState(permissionStatus: PermissionStatus.denied)],
  );
}
