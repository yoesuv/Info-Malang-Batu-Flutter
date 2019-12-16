import 'package:dio/dio.dart';
import '../models/gallery/list_item_gallery_model.dart';
import '../services/network_client.dart';

class ListGalleryRepository {

    Dio dio;

    ListGalleryRepository() {
        dio = NetworkClient().dio;
    }

    Future<ListItemGalleryModel> getListGallery() async {
        final Response response = await dio.get('/Gallery_Malang_Batu.json');
        return ListItemGalleryModel.fromJson(response.data);
    }

}
