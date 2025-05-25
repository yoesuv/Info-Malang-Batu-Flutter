import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/list_place_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/list_place_event.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/list_item_place_model.dart';
import 'mock/list_place_repository_mock.dart';
import 'package:info_malang_batu_flutter/src/core/states/list_place_state.dart';
import 'package:info_malang_batu_flutter/src/data/list_place_type.dart';

import 'response/list_place_all.dart';
import 'utils/json_helper.dart';

void main() {
  late ListPlaceBloc listPlaceBloc;
  late ListPlaceRepositoryMock listPlaceRepositoryMock;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    listPlaceRepositoryMock = ListPlaceRepositoryMock();
    listPlaceBloc = ListPlaceBloc(listPlaceRepositoryMock);
  });

  tearDown(() {
    listPlaceBloc.close();
  });

  test("JSON valid data", () async {
    var strJson = await loadJsonFromAsset('test/json/list_place_all.json');
    final List<dynamic> jsonList = jsonDecode(strJson);
    var places = ListItemPlaceModel.fromJson(jsonList);
    expect(places.listItemPlaceModel.length, 3);
  });

  blocTest<ListPlaceBloc, ListPlaceState>(
    "init location bloc success all",
    build: () => listPlaceBloc,
    act: (bloc) => bloc.add(ListPlaceEventInit(ListPlaceType.ALL)),
    expect:
        () => [
          ListPlaceState(
            status: FormzSubmissionStatus.inProgress,
            listPlaceType: ListPlaceType.ALL,
            listPlace: null,
          ),
          ListPlaceState(
            status: FormzSubmissionStatus.success,
            listPlaceType: ListPlaceType.ALL,
            listPlace: responseSuccessListPlaceAll,
          ),
        ],
  );

  blocTest<ListPlaceBloc, ListPlaceState>(
    "change location kota malang bloc success",
    build: () => listPlaceBloc,
    act: (bloc) => bloc.add(ListPlaceEventLocationChanged(ListPlaceType.MALANG)),
    expect:
        () => [
      ListPlaceState(
        status: FormzSubmissionStatus.inProgress,
        listPlaceType: ListPlaceType.MALANG,
        listPlace: null,
      ),
      ListPlaceState(
        status: FormzSubmissionStatus.success,
        listPlaceType: ListPlaceType.MALANG,
        listPlace: responseSuccessListPlaceKotaMalang,
      ),
    ],
  );
}
