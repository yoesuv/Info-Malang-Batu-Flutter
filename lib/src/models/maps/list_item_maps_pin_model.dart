import 'item_maps_pin_model.dart';

class ListItemMapsPinModel {

    ListItemMapsPinModel.fromJson(List<dynamic> parsedJson):
    listItemGalleryModel = parsedJson.map((index) => ItemMapsPinModel.fromJson(index)).toList();

    final List<ItemMapsPinModel> listItemGalleryModel;

}
