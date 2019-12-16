import 'package:dio/dio.dart';
import '../models/list_place/list_item_place_model.dart';
import '../services/network_client.dart';

class ListPlaceRepository {

    Dio dio;

    ListPlaceRepository() {
        dio = NetworkClient().dio;
    }

    Future<ListItemPlaceModel> getListPlace() async {
        final Response response = await dio.get('/List_place_malang_batu.json');
        return ListItemPlaceModel.fromJson(response.data);
    }

}
