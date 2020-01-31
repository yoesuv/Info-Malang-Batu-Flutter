import 'package:dio/dio.dart';
import '../models/gallery/list_item_gallery_model.dart';
import '../services/api_base.dart';

class ListGalleryRepository {

    ApiBase apiBase = ApiBase();

    Future<ListItemGalleryModel> getListGallery() async {
        final Response<dynamic> response = await apiBase.get('/Gallery_Malang_Batu.json') as Response<dynamic>;
        return ListItemGalleryModel.fromJson(response.data as List<dynamic>);
    }

}