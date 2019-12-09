import 'item_maps_pin_model.dart';

class ListItemMapsPinModel {

    final List<ItemMapsPinModel> listItemGalleryModel;

    ListItemMapsPinModel.fromJson(List<dynamic> parsedJson):
        listItemGalleryModel = parsedJson.map((index) => ItemMapsPinModel.fromJson(index)).toList();

}
