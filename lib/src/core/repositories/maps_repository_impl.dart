import 'package:dio/dio.dart';
import 'package:info_malang_batu_flutter/src/core/models/maps/list_item_maps_pin_model.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/maps_repository.dart';
import 'package:info_malang_batu_flutter/src/core/services/api_base.dart';

class MapsRepositoryImpl implements MapsRepository {
  ApiBase apiBase = ApiBase();

  @override
  Future<ListItemMapsPinModel> getMapsPin() async {
    final Response<dynamic> response =
        await apiBase.get('/Maps_Malang_Batu.json') as Response<dynamic>;
    final data = response.data as List<dynamic>;
    return ListItemMapsPinModel.fromJson(data);
  }
}
