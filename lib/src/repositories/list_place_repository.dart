import 'package:dio/dio.dart';
import '../models/list_place/list_item_place_model.dart';
import '../services/api_base.dart';

class ListPlaceRepository {

    ApiBase apiBase = ApiBase();

    Future<ListItemPlaceModel> getListPlace() async {
        final Response response = await apiBase.get('/List_place_malang_batu.json');
        return ListItemPlaceModel.fromJson(response.data);
    }

}
