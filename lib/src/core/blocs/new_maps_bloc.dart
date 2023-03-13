import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:info_malang_batu_flutter/src/core/events/maps_event.dart';
import 'package:info_malang_batu_flutter/src/core/models/maps/item_maps_pin_model.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/maps_repository.dart';
import 'package:info_malang_batu_flutter/src/core/states/maps_state.dart';
import 'package:info_malang_batu_flutter/src/data/constants.dart';
import 'package:permission_handler/permission_handler.dart';

class NewMapsBloc extends Bloc<MapsEvent, MapsState> {
  final MapsRepository _mapsRepository = MapsRepository();

  NewMapsBloc() : super(const MapsState()) {
    on<MapsCheckServiceLocation>(_checkLocationService);
    on<MapsEventInit>(_mapEventInit);
    on<MapsEventPermissionLocation>(_mapPermissionLocation);
  }

  void _checkLocationService(
    MapsCheckServiceLocation event,
    Emitter<MapsState> emit,
  ) async {
    if (Platform.isIOS) {
      emit(state.copyWith(
        locationService: true,
      ));
    } else {
      emit(state.copyWith(
        locationService: true,
      ));
      final status = await Permission.location.serviceStatus;
      final check = status == ServiceStatus.enabled;
      emit(state.copyWith(
        locationService: check,
      ));
    }
  }

  Future<PermissionStatus> requestLocationPermission() async {
    return await Permission.location.request();
  }

  Future<bool> isPermissionLocationGranted() async {
    return await Permission.location.status == PermissionStatus.granted;
  }

  void _mapEventInit(MapsEventInit event, Emitter<MapsState> emit) async {
    var iconSize = 64.0;
    try {
      final List<Marker> listMarker = <Marker>[];
      final icon = await BitmapDescriptor.fromAssetImage(
        createLocalImageConfiguration(
          event.context,
          size: Size(iconSize, iconSize),
        ),
        iconMarker,
      );
      final response = await _mapsRepository.getMapsPin();
      response.listItemGalleryModel
          .asMap()
          .forEach((int index, ItemMapsPinModel pin) {
        listMarker.add(
          Marker(
            markerId: MarkerId(pin.name),
            position: LatLng(pin.latitude, pin.longitude),
            infoWindow: InfoWindow(title: pin.name),
            icon: icon,
          ),
        );
      });
      emit(state.copyWith(
        listMarker: listMarker,
      ));
    } catch (e) {
      debugPrint('NewMapsBloc # error $e');
    }
  }

  void _mapPermissionLocation(
    MapsEventPermissionLocation event,
    Emitter<MapsState> emit,
  ) async {
    final request = await Permission.location.request();
    emit(state.copyWith(
      permissionStatus: request,
    ));
  }
}
