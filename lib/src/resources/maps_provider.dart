import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../data/constants.dart';
import '../models/list_item_maps_pin.dart';

class MapsProvider {

    Client client = Client();

    Future<ListItemMapsPin> getMapsPin() async {
        final response = await client.get('${Constants.baseUrl}/Maps_Malang_Batu.json');
        final parsedJson = json.decode(response.body);
        return ListItemMapsPin.fromJson(parsedJson);
    }

}
