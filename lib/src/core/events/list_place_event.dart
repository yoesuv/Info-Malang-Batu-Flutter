import 'package:equatable/equatable.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/list_item_place_model.dart';

abstract class ListPlaceEvent extends Equatable {}

class ListPlaceEventInit extends ListPlaceEvent {
  final ListItemPlaceModel listItemPlaceModel;
  ListPlaceEventInit(this.listItemPlaceModel);
  @override
  List<Object> get props => [listItemPlaceModel];
}