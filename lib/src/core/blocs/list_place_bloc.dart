import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/list_place_event.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/list_item_place_model.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/list_place_repository.dart';
import 'package:info_malang_batu_flutter/src/core/services/app_exceptions.dart';
import 'package:info_malang_batu_flutter/src/core/states/list_place_state.dart';
import 'package:info_malang_batu_flutter/src/data/list_place_type.dart';

class ListPlaceBloc extends Bloc<ListPlaceEvent, ListPlaceState> {
  final ListPlaceRepository _listPlaceRepository = ListPlaceRepository();

  ListPlaceBloc() : super(const ListPlaceState()) {
    on<ListPlaceEventInit>(_initListPlace);
    on<ListPlaceEventLocationChanged>(_loadListPlace);
  }

  void _initListPlace(ListPlaceEventInit event, Emitter<ListPlaceState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _listPlaceRepository.getListPlace();
      _showData(emit, response);
    } catch (e) {
      debugPrint('ListPlaceBloc # error $e');
      if (e is AppException) {

      } else {

      }
    }
  }

  void _loadListPlace(ListPlaceEventLocationChanged event, Emitter<ListPlaceState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      switch (event.listPlaceType) {
        case ListPlaceType.ALL:
          final response = await _listPlaceRepository.getListPlace();
          _showData(emit, response);
          break;
        case ListPlaceType.MALANG:
          final response = await _listPlaceRepository.getListPlaceKotaMalang();
          _showData(emit, response);
          break;
        case ListPlaceType.KABMALANG:
          final response = await _listPlaceRepository.getListPlaceKabMalang();
          _showData(emit, response);
          break;
        case ListPlaceType.BATU:
          final response = await _listPlaceRepository.getListPlaceKotaBatu();
          _showData(emit, response);
          break;
      }
    } catch (e) {
      debugPrint('ListPlaceBloc # error $e');
      if (e is AppException) {

      } else {

      }

    }
  }

  void _showData(Emitter<ListPlaceState> emit, ListItemPlaceModel response) {
    emit(state.copyWith(isLoading: false, listItemPlaceModel: response));
  }
}


