import 'package:equatable/equatable.dart';
import 'package:info_malang_batu_flutter/src/data/list_place_type.dart';

abstract class ListPlaceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ListPlaceEventInit extends ListPlaceEvent {
  final ListPlaceType listPlaceType;

  ListPlaceEventInit(this.listPlaceType);

  @override
  List<Object?> get props => [listPlaceType];
}

class ListPlaceEventLocationChanged extends ListPlaceEvent {
  final ListPlaceType listPlaceType;

  ListPlaceEventLocationChanged(this.listPlaceType);

  @override
  List<Object> get props => [listPlaceType];
}
