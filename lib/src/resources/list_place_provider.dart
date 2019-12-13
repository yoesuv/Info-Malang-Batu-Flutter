import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../data/constants.dart';
import '../models/list_place/list_item_place_model.dart';

class ListPlaceProvider {

    Client client = Client();

    Future<ListItemPlaceModel> getListPlace() async {
        final response = await client.get('${Constants.baseUrl}/List_place_malang_batu.json');
        final parsedJson = json.decode(response.body);
        return ListItemPlaceModel.fromJson(parsedJson);
    }

}
