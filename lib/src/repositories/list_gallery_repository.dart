import 'package:dio/dio.dart';
import '../models/gallery/list_item_gallery_model.dart';
import '../services/services.dart';

class ListGalleryRepository {

    Service service = Service();

    Future<ListItemGalleryModel> getListGallery() async {
        final Response response = await service.getListGallery();
        return ListItemGalleryModel.fromJson(response.data);
    }

}
