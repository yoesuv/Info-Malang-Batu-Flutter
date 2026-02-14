import 'item_place_model.dart';

class ListItemPlaceModel {
  ListItemPlaceModel.fromJson(List<dynamic> parsedJson)
    : listItemPlaceModel = parsedJson
          .map(
            (dynamic e) => ItemPlaceModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();

  final List<ItemPlaceModel> listItemPlaceModel;
}
