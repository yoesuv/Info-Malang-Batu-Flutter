import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:info_malang_batu_flutter/src/core/events/list_place_event.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/item_place_model.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/list_place_repository.dart';
import 'package:info_malang_batu_flutter/src/core/states/list_place_state.dart';
import 'package:info_malang_batu_flutter/src/data/list_place_type.dart';

class ListPlaceBloc extends Bloc<ListPlaceEvent, ListPlaceState> {
  final ListPlaceRepository _listPlaceRepository = ListPlaceRepository();

  ListPlaceBloc() : super(const ListPlaceState()) {
    on<ListPlaceEventInit>(_initListPlace);
    on<ListPlaceEventLocationChanged>(_loadListPlace);
  }

  void _initListPlace(
    ListPlaceEventInit event,
    Emitter<ListPlaceState> emit,
  ) async {
    final check1 = state.listPlaceType != event.listPlaceType;
    final check2 = state.listPlace?.isEmpty == true;
    if (check1 || check2) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        listPlaceType: event.listPlaceType,
      ));
      try {
        final response = await _listPlaceRepository.getListPlace();
        _showData(emit, response.listItemPlaceModel);
      } catch (e) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          listPlace: [],
          listPlaceType: ListPlaceType.ALL,
        ));
      }
    }
  }

  void _loadListPlace(
    ListPlaceEventLocationChanged event,
    Emitter<ListPlaceState> emit,
  ) async {
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      listPlaceType: event.listPlaceType,
    ));
    try {
      switch (event.listPlaceType) {
        case ListPlaceType.ALL:
          final response = await _listPlaceRepository.getListPlace();
          _showData(emit, response.listItemPlaceModel);
          break;
        case ListPlaceType.MALANG:
          final response = await _listPlaceRepository.getListPlaceKotaMalang();
          _showData(emit, response.listItemPlaceModel);
          break;
        case ListPlaceType.KABMALANG:
          final response = await _listPlaceRepository.getListPlaceKabMalang();
          _showData(emit, response.listItemPlaceModel);
          break;
        case ListPlaceType.BATU:
          final response = await _listPlaceRepository.getListPlaceKotaBatu();
          _showData(emit, response.listItemPlaceModel);
          break;
      }
    } catch (e) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        listPlace: [],
        listPlaceType: ListPlaceType.ALL,
      ));
    }
  }

  void _showData(Emitter<ListPlaceState> emit, List<ItemPlaceModel>? places) {
    emit(state.copyWith(
      status: FormzSubmissionStatus.success,
      listPlace: places,
    ));
  }
}
