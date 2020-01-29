import 'package:dio/dio.dart';
import '../models/list_place/list_item_place_model.dart';
import '../services/api_base.dart';

class ListPlaceRepository {

    ApiBase apiBase = ApiBase();

    Future<ListItemPlaceModel> getListPlace() async {
        final Response<dynamic> response = await apiBase.get('/List_place_malang_batu.json') as Response<dynamic>;
        return ListItemPlaceModel.fromJson(response.data as List<dynamic>);
    }

    Future<ListItemPlaceModel> getListPlaceKotaMalang() async {
        final Response<dynamic> response = await apiBase.get('/List_place_kota_malang.json') as Response<dynamic>;
        return ListItemPlaceModel.fromJson(response.data as List<dynamic>);
    }

    Future<ListItemPlaceModel> getListPlaceKabMalang() async {
        final Response<dynamic> response = await apiBase.get('/List_place_kab_malang.json') as Response<dynamic>;
        return ListItemPlaceModel.fromJson(response.data as List<dynamic>);
    }

    Future<ListItemPlaceModel> getListPlaceKotaBatu() async {
        final Response<dynamic> response = await apiBase.get('/List_place_kota_batu.json') as Response<dynamic>;
        return ListItemPlaceModel.fromJson(response.data as List<dynamic>);
    }

}
