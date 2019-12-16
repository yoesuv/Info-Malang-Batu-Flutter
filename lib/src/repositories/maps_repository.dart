import 'package:dio/dio.dart';
import '../models/maps/list_item_maps_pin_model.dart';
import '../services/network_client.dart';

class MapsRepository {

    Dio dio;

    MapsRepository() {
        dio = NetworkClient().dio;
    }

    Future<ListItemMapsPinModel> getMapsPin() async {
        final Response response = await dio.get('/Maps_Malang_Batu.json');
        return ListItemMapsPinModel.fromJson(response.data);
    }

}
