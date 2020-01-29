import 'package:dio/dio.dart';
import '../models/maps/list_item_maps_pin_model.dart';
import '../services/api_base.dart';

class MapsRepository {

    ApiBase apiBase = ApiBase();

    Future<ListItemMapsPinModel> getMapsPin() async {
        final Response<dynamic> response = await apiBase.get('/Maps_Malang_Batu.json') as Response<dynamic>;
        return ListItemMapsPinModel.fromJson(response.data as List<dynamic>);
    }

}
