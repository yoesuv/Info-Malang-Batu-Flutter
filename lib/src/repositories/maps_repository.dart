import 'package:dio/dio.dart';
import '../models/maps/list_item_maps_pin_model.dart';
import '../services/services.dart';

class MapsRepository {

    Service service = Service();

    Future<ListItemMapsPinModel> getMapsPin() async {
        final Response response = await service.getMapsPin();
        return ListItemMapsPinModel.fromJson(response.data);
    }

}
