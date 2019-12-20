import 'package:dio/dio.dart';
import '../services/services.dart';
import '../models/list_place/list_item_place_model.dart';

class ListPlaceRepository {

    Service service = Service();

    Future<ListItemPlaceModel> getListPlace() async {
        final Response response = await service.getListPlace();
        return ListItemPlaceModel.fromJson(response.data);
    }

}
