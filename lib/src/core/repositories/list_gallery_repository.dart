import 'package:dio/dio.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/list_item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/core/services/api_base.dart';

class ListGalleryRepository {
  ApiBase apiBase = ApiBase();

  Future<ListItemGalleryModel> getListGallery() async {
    final Response<dynamic> response = await apiBase.get('/Gallery_Malang_Batu.json') as Response<dynamic>;
    return ListItemGalleryModel.fromJson(response.data as List<dynamic>);
  }
}
