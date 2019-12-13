import '../services/network_client.dart';
import '../models/list_place/list_item_place_model.dart';
import '../models/service_model.dart';
import 'package:dio/dio.dart';

class ListPlaceRepository {

    Future<ServiceModel> getListPlace() async {
        ServiceModel serviceModel = ServiceModel();
        try {
            final Response response = await NetworkClient.dio.get('/List_place_malang_batu.json');
            final ListItemPlaceModel listItemPlaceModel = ListItemPlaceModel.fromJson(response.data);
            serviceModel.model = listItemPlaceModel;
            serviceModel.statusCode = response.statusCode;
        } catch (error) {
            if (error is DioError) {
                serviceModel.statusCode = error.response.statusCode;
                serviceModel.errorMessage = error.response.statusMessage;
            } else {
                serviceModel.statusCode = 0;
                serviceModel.errorMessage = 'UNKNOWN';
            }
        }
        return serviceModel;
    }

}
