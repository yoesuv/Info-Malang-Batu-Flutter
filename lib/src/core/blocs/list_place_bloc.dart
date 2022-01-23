import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/list_place_event.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/list_place_repository.dart';
import 'package:info_malang_batu_flutter/src/core/states/list_place_state.dart';
import 'package:info_malang_batu_flutter/src/data/list_place_type.dart';

class ListPlaceBloc extends Bloc<ListPlaceEvent, ListPlaceState> {
  final ListPlaceRepository _listPlaceRepository = ListPlaceRepository();

  ListPlaceBloc() : super(const ListPlaceState()) {
    on<ListPlaceEventInit>(_loadListPlace);
  }

  void _loadListPlace(ListPlaceEventInit event, Emitter<ListPlaceState> emit) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    try {
      switch (event.listPlaceType) {
        case ListPlaceType.ALL:
          final response = await _listPlaceRepository.getListPlace();
          emit(state.copyWith(isLoading: false, listItemPlaceModel: response));
          break;
        case ListPlaceType.MALANG:
          final response = _listPlaceRepository.getListPlaceKotaMalang();
          break;
        case ListPlaceType.KABMALANG:
          final response = _listPlaceRepository.getListPlaceKabMalang();
          break;
        case ListPlaceType.BATU:
          final response = _listPlaceRepository.getListPlaceKotaBatu();
          break;
      }
    } catch (e) {
      debugPrint('ListPlaceBloc # error $e');
    }
  }
}
