import 'item_gallery_model.dart';

class ListItemGalleryModel {
  ListItemGalleryModel.fromJson(List<dynamic> parsedJson)
    : listItemGalleryModel = parsedJson
          .map(
            (dynamic e) => ItemGalleryModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();

  final List<ItemGalleryModel> listItemGalleryModel;
}
