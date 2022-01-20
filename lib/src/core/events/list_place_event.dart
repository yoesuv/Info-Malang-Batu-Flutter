import 'package:equatable/equatable.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/list_item_place_model.dart';
import 'package:info_malang_batu_flutter/src/data/list_place_type.dart';

abstract class ListPlaceEvent extends Equatable {}

class ListPlaceEventInit extends ListPlaceEvent {
  final ListPlaceType listPlaceType;
  final ListItemPlaceModel listItemPlaceModel;
  ListPlaceEventInit(this.listPlaceType, this.listItemPlaceModel);
  @override
  List<Object> get props => [listPlaceType, listItemPlaceModel];
}