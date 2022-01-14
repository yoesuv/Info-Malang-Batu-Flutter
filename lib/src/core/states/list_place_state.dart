import 'package:equatable/equatable.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/list_item_place_model.dart';

class ListPlaceState extends Equatable {

  final bool? isLoading;
  final ListItemPlaceModel? listItemPlaceModel;

  const ListPlaceState({this.isLoading, this.listItemPlaceModel});

  ListPlaceState copyWith(bool? isLoading, ListItemPlaceModel? listItemPlaceModel) {
    return ListPlaceState(
      isLoading: isLoading ?? this.isLoading,
      listItemPlaceModel: listItemPlaceModel ?? this.listItemPlaceModel,
    );
  }

  @override
  List<Object?> get props => [isLoading, listItemPlaceModel];

}