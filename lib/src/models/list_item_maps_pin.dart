import 'item_maps_pin.dart';

class ListItemMapsPin {

    final List<ItemMapsPin> listItemGalleryModel;

    ListItemMapsPin.fromJson(List<dynamic> parsedJson):
        listItemGalleryModel = parsedJson.map((index) => ItemMapsPin.fromJson(index)).toList();

}
