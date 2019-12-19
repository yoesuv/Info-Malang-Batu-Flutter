import 'package:dio/dio.dart';
import '../models/gallery/list_item_gallery_model.dart';
import '../services/api_base.dart';

class ListGalleryRepository {

    ApiBase apiBase = ApiBase();

    Future<ListItemGalleryModel> getListGallery() async {
        final Response response = await apiBase.get('/Gallery_Malang_Batu.json');
        return ListItemGalleryModel.fromJson(response.data);
    }

}
