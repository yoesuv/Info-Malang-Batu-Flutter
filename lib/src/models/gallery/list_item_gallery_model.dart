import 'item_gallery_model.dart';

class ListItemGalleryModel {

    ListItemGalleryModel.fromJson(List<dynamic> parsedJson):
    listItemGalleryModel = parsedJson.map((index) => ItemGalleryModel.fromJson(index)).toList();

    final List<ItemGalleryModel> listItemGalleryModel;

}
