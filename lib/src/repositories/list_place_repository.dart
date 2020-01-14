import 'package:dio/dio.dart';
import '../models/list_place/list_item_place_model.dart';
import '../services/services.dart';

class ListPlaceRepository {

    Service service = Service();

    Future<ListItemPlaceModel> getListPlace() async {
        final Response<dynamic> response = await service.getListPlace() as Response<dynamic>;
        return ListItemPlaceModel.fromJson(response.data as List<dynamic>);
    }

    Future<ListItemPlaceModel> getListPlaceKotaMalang() async {
        final Response<dynamic> response = await service.getListPlaceKotaMalang() as Response<dynamic>;
        return ListItemPlaceModel.fromJson(response.data as List<dynamic>);
    }

    Future<ListItemPlaceModel> getListPlaceKabMalang() async {
        final Response<dynamic> response = await service.getListPlaceKabMalang() as Response<dynamic>;
        return ListItemPlaceModel.fromJson(response.data as List<dynamic>);
    }

    Future<ListItemPlaceModel> getListPlaceKotaBatu() async {
        final Response<dynamic> response = await service.getListPlaceKotaBatu() as Response<dynamic>;
        return ListItemPlaceModel.fromJson(response.data as List<dynamic>);
    }

}
