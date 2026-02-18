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
import 'response/list_place_batu.dart';
import 'response/list_place_kab_malang.dart';
import 'response/list_place_kota_malang.dart';
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

  test("JSON valid data all", () async {
    var strJson = await loadJsonFromAsset('test/json/list_place_all.json');
    final List<dynamic> jsonList = jsonDecode(strJson);
    var places = ListItemPlaceModel.fromJson(jsonList);
    expect(places.listItemPlaceModel.length, 3);
  });

  blocTest<ListPlaceBloc, ListPlaceState>(
    "init location bloc success all",
    build: () => listPlaceBloc,
    act: (bloc) => bloc.add(ListPlaceEventInit(ListPlaceType.all)),
    expect: () => [
      ListPlaceState(
        status: FormzSubmissionStatus.inProgress,
        listPlaceType: ListPlaceType.all,
        listPlace: null,
      ),
      ListPlaceState(
        status: FormzSubmissionStatus.success,
        listPlaceType: ListPlaceType.all,
        listPlace: responseSuccessListPlaceAll,
      ),
    ],
  );

  blocTest<ListPlaceBloc, ListPlaceState>(
    "change location kota malang bloc success",
    build: () => listPlaceBloc,
    act: (bloc) =>
        bloc.add(ListPlaceEventLocationChanged(ListPlaceType.malang)),
    expect: () => [
      ListPlaceState(
        status: FormzSubmissionStatus.inProgress,
        listPlaceType: ListPlaceType.malang,
        listPlace: null,
      ),
      ListPlaceState(
        status: FormzSubmissionStatus.success,
        listPlaceType: ListPlaceType.malang,
        listPlace: responseSuccessListPlaceKotaMalang,
      ),
    ],
  );

  blocTest<ListPlaceBloc, ListPlaceState>(
    "change location kota batu bloc success",
    build: () => listPlaceBloc,
    act: (bloc) => bloc.add(ListPlaceEventLocationChanged(ListPlaceType.batu)),
    expect: () => [
      ListPlaceState(
        status: FormzSubmissionStatus.inProgress,
        listPlaceType: ListPlaceType.batu,
        listPlace: null,
      ),
      ListPlaceState(
        status: FormzSubmissionStatus.success,
        listPlaceType: ListPlaceType.batu,
        listPlace: responseSuccessListPlaceBatu,
      ),
    ],
  );

  blocTest<ListPlaceBloc, ListPlaceState>(
    "change location kabupaten malang bloc success",
    build: () => listPlaceBloc,
    act: (bloc) =>
        bloc.add(ListPlaceEventLocationChanged(ListPlaceType.kabMalang)),
    expect: () => [
      ListPlaceState(
        status: FormzSubmissionStatus.inProgress,
        listPlaceType: ListPlaceType.kabMalang,
        listPlace: null,
      ),
      ListPlaceState(
        status: FormzSubmissionStatus.success,
        listPlaceType: ListPlaceType.kabMalang,
        listPlace: responseSuccessListPlaceKabMalang,
      ),
    ],
  );
}
