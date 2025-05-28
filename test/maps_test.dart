import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/maps_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/maps_event.dart';
import 'package:info_malang_batu_flutter/src/core/models/maps/list_item_maps_pin_model.dart';
import 'package:info_malang_batu_flutter/src/core/states/maps_state.dart';

import 'mock/maps_repository_mock.dart';
import 'response/maps.dart';
import 'utils/json_helper.dart';

void main() {
  late MapsBloc mapsBloc;
  late MapsRepositoryMock mapsRepositoryMock;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mapsRepositoryMock = MapsRepositoryMock();
    mapsBloc = MapsBloc(mapsRepositoryMock);
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
}
