import 'dart:convert';

import 'package:info_malang_batu_flutter/src/core/models/maps/list_item_maps_pin_model.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/maps_repository.dart';

import '../utils/json_helper.dart';

class MapsRepositoryMock implements MapsRepository {
  @override
  Future<ListItemMapsPinModel> getMapsPin() async {
    final response = await loadJsonFromAsset('test/json/maps.json');
    final List<dynamic> jsonList = jsonDecode(response);
    return ListItemMapsPinModel.fromJson(jsonList);
  }
}
