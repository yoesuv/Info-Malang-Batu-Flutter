import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/maps_event.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/maps_repository.dart';
import 'package:info_malang_batu_flutter/src/core/states/maps_state.dart';
import 'package:permission_handler/permission_handler.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  final MapsRepository _mapsRepository;

  MapsBloc(this._mapsRepository) : super(const MapsState()) {
    on<MapsEventInit>(_mapEventInit);
    on<MapsCheckServiceLocation>(_checkLocationService);
    on<MapsEventPermissionLocation>(_mapPermissionLocation);
  }

  void _mapEventInit(MapsEventInit event, Emitter<MapsState> emit) async {
    try {
      final isEmpty = (state.listPin ?? []).isEmpty;
      if (isEmpty) {
        final response = await _mapsRepository.getMapsPin();
        emit(state.copyWith(listPin: response.listItemGalleryModel));
      }
    } catch (e) {
      emit(state.copyWith(listPin: []));
    }
  }

  void _checkLocationService(
    MapsCheckServiceLocation event,
    Emitter<MapsState> emit,
  ) async {
    if (Platform.isIOS) {
      emit(state.copyWith(locationService: true));
    } else {
      emit(state.copyWith(locationService: true));
      final status = await Permission.location.serviceStatus;
      final check = status == ServiceStatus.enabled;
      emit(state.copyWith(locationService: check));
    }
  }

  void _mapPermissionLocation(
    MapsEventPermissionLocation event,
    Emitter<MapsState> emit,
  ) async {
    final request = await Permission.location.request();
    emit(state.copyWith(permissionStatus: request));
  }
}
