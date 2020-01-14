import 'package:dio/dio.dart';
import '../models/list_place/list_item_place_model.dart';
import '../services/services.dart';

class ListPlaceRepository {

    Service service = Service();

    Future<ListItemPlaceModel> getListPlace() async {
        final Response response = await service.getListPlace();
        return ListItemPlaceModel.fromJson(response.data);
    }

    Future<ListItemPlaceModel> getListPlaceKotaMalang() async {
        final Response response = await service.getListPlaceKotaMalang();
        return ListItemPlaceModel.fromJson(response.data);
    }

    Future<ListItemPlaceModel> getListPlaceKabMalang() async {
        final Response response = await service.getListPlaceKabMalang();
        return ListItemPlaceModel.fromJson(response.data);
    }

    Future<ListItemPlaceModel> getListPlaceKotaBatu() async {
        final Response response = await service.getListPlaceKotaBatu();
        return ListItemPlaceModel.fromJson(response.data);
    }

}
