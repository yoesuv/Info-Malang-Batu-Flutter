import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/item_place_model.dart';
import 'package:info_malang_batu_flutter/src/data/list_place_type.dart';

class ListPlaceState extends Equatable {
  final FormzSubmissionStatus status;
  final List<ItemPlaceModel>? listPlace;
  final ListPlaceType? listPlaceType;

  const ListPlaceState({
    this.status = FormzSubmissionStatus.initial,
    this.listPlace,
    this.listPlaceType,
  });

  ListPlaceState copyWith({
    FormzSubmissionStatus? status,
    List<ItemPlaceModel>? listPlace,
    ListPlaceType? listPlaceType,
  }) {
    return ListPlaceState(
      status: status ?? this.status,
      listPlace: listPlace ?? this.listPlace,
      listPlaceType: listPlaceType ?? this.listPlaceType,
    );
  }

  @override
  List<Object?> get props => [
        status,
        listPlace,
        listPlaceType,
      ];
}
