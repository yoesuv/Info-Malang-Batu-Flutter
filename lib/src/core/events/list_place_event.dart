import 'package:equatable/equatable.dart';
import 'package:info_malang_batu_flutter/src/data/list_place_type.dart';

abstract class ListPlaceEvent extends Equatable {}

class ListPlaceEventInit extends ListPlaceEvent {
  @override
  List<Object?> get props => [];
}

class ListPlaceEventLocationChanged extends ListPlaceEvent {
  final ListPlaceType listPlaceType;

  ListPlaceEventLocationChanged(this.listPlaceType);

  @override
  List<Object> get props => [listPlaceType];
}
