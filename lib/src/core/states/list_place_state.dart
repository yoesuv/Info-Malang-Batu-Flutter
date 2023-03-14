import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/list_item_place_model.dart';
import 'package:info_malang_batu_flutter/src/data/list_place_type.dart';

class ListPlaceState extends Equatable {
  final FormzSubmissionStatus status;
  final ListItemPlaceModel? listItemPlaceModel;
  final ListPlaceType? listPlaceType;

  const ListPlaceState({
    this.status = FormzSubmissionStatus.initial,
    this.listItemPlaceModel,
    this.listPlaceType,
  });

  ListPlaceState copyWith({
    FormzSubmissionStatus? status,
    ListItemPlaceModel? listItemPlaceModel,
    ListPlaceType? listPlaceType,
  }) {
    return ListPlaceState(
      status: status ?? this.status,
      listItemPlaceModel: listItemPlaceModel ?? this.listItemPlaceModel,
      listPlaceType: listPlaceType ?? this.listPlaceType,
    );
  }

  @override
  List<Object?> get props => [
        status,
        listItemPlaceModel,
        listPlaceType,
      ];
}
