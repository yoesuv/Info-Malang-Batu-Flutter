import 'item_gallery_model.dart';

class ListItemGalleryModel {

    final List<ItemGalleryModel> listItemGalleryModel;

    ListItemGalleryModel.fromJson(List<dynamic> parsedJson):
        listItemGalleryModel = parsedJson.map((index) => ItemGalleryModel.fromJson(index)).toList();

}
