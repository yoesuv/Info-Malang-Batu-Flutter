import 'item_place_model.dart';

class ListItemPlaceModel {

    final List<ItemPlaceModel> listItemPlaceModel;

    ListItemPlaceModel.fromJson(List<dynamic> parsedJson):
        listItemPlaceModel = parsedJson.map((index) => ItemPlaceModel.fromJson(index)).toList();
}
