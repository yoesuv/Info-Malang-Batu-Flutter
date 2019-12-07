import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../data/constants.dart';
import '../models/item_place_model.dart';

class ListPlaceProvider {

    Client client = Client();

    Future<List<ItemPlaceModel>> getListPlace() async {
        final response = await client.get('${Constants.baseUrl}/List_place_malang_batu.json');
        List<Map<String, dynamic>> jsonList = json.decode(response.body);

        List<ItemPlaceModel> listItemModel = jsonList.map(
            (jsonElement) => ItemPlaceModel.fromJson(jsonElement)
        );

        return listItemModel;
    }

}
