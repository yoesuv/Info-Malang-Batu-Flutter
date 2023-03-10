import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/list_item_place_model.dart';

class ListPlaceState extends Equatable {
  final FormzSubmissionStatus status;
  final ListItemPlaceModel? listItemPlaceModel;

  const ListPlaceState({
    this.status = FormzSubmissionStatus.initial,
    this.listItemPlaceModel,
  });

  ListPlaceState copyWith({
    FormzSubmissionStatus? status,
    ListItemPlaceModel? listItemPlaceModel,
  }) {
    return ListPlaceState(
      status: status ?? this.status,
      listItemPlaceModel: listItemPlaceModel ?? this.listItemPlaceModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        listItemPlaceModel,
      ];
}
