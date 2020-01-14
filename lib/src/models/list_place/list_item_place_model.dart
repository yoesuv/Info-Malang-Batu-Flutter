import 'item_place_model.dart';

class ListItemPlaceModel {
    
    ListItemPlaceModel.fromJson(List<dynamic> parsedJson):
    listItemPlaceModel = parsedJson.map((index) => ItemPlaceModel.fromJson(index)).toList();

    final List<ItemPlaceModel> listItemPlaceModel;
}
