import 'package:info_malang_batu_flutter/src/core/models/gallery/list_item_gallery_model.dart';

abstract class ListGalleryRepository {
  Future<ListItemGalleryModel> getListGallery();
}
