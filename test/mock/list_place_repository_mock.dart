import 'dart:convert';

import 'package:info_malang_batu_flutter/src/utils/json_helper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/list_item_place_model.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/list_place_repository.dart';

class ListPlaceRepositoryMock extends Mock implements ListPlaceRepository {
  @override
  Future<ListItemPlaceModel> getListPlace() async {
    final response = await loadJsonFromAsset('test/json/list_place_all.json');
    final List<dynamic> jsonList = jsonDecode(response);
    return ListItemPlaceModel.fromJson(jsonList);
  }

  @override
  Future<ListItemPlaceModel> getListPlaceKabMalang() async {
    final response = await loadJsonFromAsset('test/json/list_place_all.json');
    return ListItemPlaceModel.fromJson(response as List<dynamic>);
  }

  @override
  Future<ListItemPlaceModel> getListPlaceKotaBatu() async {
    final response = await loadJsonFromAsset('test/json/list_place_all.json');
    return ListItemPlaceModel.fromJson(response as List<dynamic>);
  }

  @override
  Future<ListItemPlaceModel> getListPlaceKotaMalang() async {
    final response = await loadJsonFromAsset('test/json/list_place_kota_malang.json');
    final List<dynamic> jsonList = jsonDecode(response);
    return ListItemPlaceModel.fromJson(jsonList);
  }
}
