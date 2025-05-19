import 'package:info_malang_batu_flutter/src/core/models/list_place/list_item_place_model.dart';

abstract class ListPlaceRepository {
  Future<ListItemPlaceModel> getListPlace();
  Future<ListItemPlaceModel> getListPlaceKotaMalang();
  Future<ListItemPlaceModel> getListPlaceKabMalang();
  Future<ListItemPlaceModel> getListPlaceKotaBatu();
}