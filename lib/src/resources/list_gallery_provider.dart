import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../data/constants.dart';
import '../models/list_item_gallery_model.dart';

class ListGalleryProvider {

    Client client = Client();

    Future<ListItemGalleryModel> getListGallery() async {
        final response = await client.get('${Constants.baseUrl}/Gallery_Malang_Batu.json');
        final parsedJson = json.decode(response.body);
        return ListItemGalleryModel.fromJson(parsedJson);
    }

}
