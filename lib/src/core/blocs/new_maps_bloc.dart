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
    on<MapsEventInit>(_mapEventInit);
  }

  Future<bool> checkLocationService() async {
    if (Platform.isIOS) {
      return true;
    } else {
      final ServiceStatus status = await Permission.location.serviceStatus;
      return status == ServiceStatus.enabled;
    }
  }

  void _mapEventInit(MapsEventInit event, Emitter<MapsState> emit) async {
    var iconSize = 64.0;
    try {
      final List<Marker> listMarker = <Marker>[];
      final icon = await BitmapDescriptor.fromAssetImage(createLocalImageConfiguration(event.context, size: Size(iconSize, iconSize)), iconMarker);
      final response = await _mapsRepository.getMapsPin();
      response.listItemGalleryModel.asMap().forEach((int index, ItemMapsPinModel pin) {
        listMarker.add(
          Marker(
            markerId: MarkerId(pin.name),
            position: LatLng(pin.latitude, pin.longitude),
            infoWindow: InfoWindow(title: pin.name),
            icon: icon,
          ),
        );
      });
      emit(state.copyWith(listMarker: listMarker));
    } catch (e) {
      debugPrint('NewMapsBloc # error $e');
    }
  }

}
