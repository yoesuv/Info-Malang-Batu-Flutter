import 'item_maps_pin_model.dart';

class ListItemMapsPinModel {
  ListItemMapsPinModel.fromJson(List<dynamic> parsedJson)
    : listItemGalleryModel = parsedJson
          .map(
            (dynamic e) => ItemMapsPinModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();

  final List<ItemMapsPinModel> listItemGalleryModel;
}
